import os
import json
from . import settings
from asgiref.sync import sync_to_async
from django.utils import timezone
from django.http import Http404, HttpResponse, JsonResponse
from django.urls import reverse
from django.shortcuts import render, get_object_or_404
from django.shortcuts import redirect
from django.contrib.auth import login, logout, authenticate
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from core.forms import TeamForm, PlayerForm, SaleForm, InventoryForm, ProductForm, EditProductForm, CategoryForm, TournamentTeamForm, TournamentCreateForm, CardPlayerForm, ReserveCalendarForm, CommentForm
from user.forms import CustomUserForm, CustomSigninForm, ChangePasswordForm, EditProfileForm
from user.models import UserBoli
from core.models import Team, Player, Tournament, TournamentTeam, Product, Reservation, Sale, SaleTournament, SaleReservation, SaleCar, Car, Inventory, Entry, Output, CarInventory, Category, Calendar, Comment, Like

#------------------Ventas---------------------------
#Venta
@login_required
def sale(request, type_id, type_name):
    cars_inventorys = False
    #Detectando que tipo de venta es
    if type_name == 'Torneo':
        inf = get_object_or_404(Tournament, id=type_id)
        team = get_object_or_404(Team, user_id=request.user.id)
        if team.players_num < 11:
            messages.error(request, '<i class="fa-solid fa-triangle-exclamation fa-bounce fa-xs"></i> Sin jugadores suficientes, mínimo 11 para un torneo')
            return redirect('tournament')
        
    if type_name == 'Productos':
        inf = get_object_or_404(Car, id=type_id)
        if inf.total_products <= 0:
            messages.error(request, '<i class="fa-solid fa-triangle-exclamation fa-bounce fa-xs"></i> No hay productos para comprar')
            return redirect('store')
        cars_inventorys = CarInventory.objects.all().filter(car_id=inf.id)

    if type_name == 'Reserva':
        inf = get_object_or_404(Reservation, id=type_id)

    #Guardando venta en tal caso
    if request.method == 'POST':
        form = SaleForm(request.POST)
        if form.is_valid():
            sale = form.save(commit=False)
            sale.user_id = request.user.id
            sale.save()

            #Agregando id's a tabla intermedia
            if type_name == 'Torneo':
                intermediate = SaleTournament(sale_id=sale.id, tournament_id=inf.id)
                
            if type_name == 'Productos':
                inf.active = False
                inf.save()
                
                intermediate = SaleCar(sale_id=sale.id, car_id=inf.id)
                cars = Car.objects.all().filter(active=True)
                sale.product_quantity = inf.total_products
                sale.save()
                for car_inventory in cars_inventorys:
                    car_inventory.inventory.quantity_reserved += car_inventory.quantity
                    car_inventory.inventory.product_quantity -= car_inventory.quantity
                    car_inventory.inventory.save()

                    # En caso tal de que los productos sean menores a 5 se deberá actualizar los carritos de los clientes para evitar conflictos
                    if car_inventory.inventory.product_quantity < 5:
                        for car in cars:
                            cars_inventorys2 = CarInventory.objects.all().filter(car_id=car.id)
                            for car_inventory2 in cars_inventorys2:
                                if car_inventory2.inventory_id == car_inventory.inventory_id:
                                    # Se cambia cantidad en tabla intermedia
                                    actual_quantity = car_inventory2.quantity
                                    car_inventory2.quantity = car_inventory.inventory.product_quantity
                                    car_inventory2.save()

                                    # Se cambia cantidad total y precio en carrito
                                    car_inventory2.car.total_products -= (actual_quantity - car_inventory.inventory.product_quantity)
                                    car_inventory2.car.cost -= car_inventory.inventory.product.cost * (actual_quantity - car_inventory.inventory.product_quantity)
                                    car_inventory2.car.save()

                                    if car_inventory2.quantity <= 0:
                                        car_inventory2.delete()

                                    continue
                        
            if type_name == 'Reserva':
                intermediate = SaleReservation(sale_id=sale.id, reservation_id=inf.id)
                inf.confirmed = True
                inf.save()

            #Guardando tabla intermedia
            intermediate.save()
            messages.success(request, f'<i class="fa-solid fa-circle-check fa-bounce fa-xs"></i> Compra en proceso, consulta tu perfil 😄')
            return redirect('index')
        else:
            raise Http404(form.errors)
    
    else:
        form = SaleForm()

    return render(request, 'sale.html', {'form':form, 'type_name':type_name, 'inf':inf, 'cars_inventorys': cars_inventorys})

#Información de la venta
@login_required
def sale_information(request, sale_id):
    user = get_object_or_404(UserBoli, id=request.user.id)
    sale = get_object_or_404(Sale, id=sale_id)
    cars_inventorys = False
    team = False
    
    if sale.type == 'Torneo':
        inf = get_object_or_404(SaleTournament, sale_id=sale.id)  
        inf = inf.tournament
        team = Team.objects.all().filter(user_id=sale.user_id).first()

    if sale.type == 'Productos':
        inf = get_object_or_404(SaleCar, sale_id=sale.id)  
        inf = inf.car
        cars_inventorys = CarInventory.objects.all().filter(car_id=inf.id)

    if sale.type == 'Reserva':
        inf = get_object_or_404(SaleReservation, sale_id=sale.id)
        inf = inf.reservation

    return render(request, 'sale/sale_information.html', {'user':user, 'sale':sale, 'inf':inf, 'team':team, 'cars_inventorys':cars_inventorys})

#Historial de ventas
@login_required
def sale_historic(request):
    user = get_object_or_404(UserBoli, id=request.user.id)

    if user.is_staff:
        sales = Sale.objects.all().order_by('-date')
    else:
        sales = Sale.objects.all().filter(user_id=user.id).order_by('-date')

    return render(request, 'sale/sale_historic.html', {'user':user, 'sales':sales})

#Compra confirmada
@login_required
def sale_confirm(request, sale_id):
    sale = Sale.objects.all().filter(id=sale_id).first()
    user = UserBoli.objects.all().filter(id=sale.user_id).first()
    if not request.user.is_staff:
        raise Http404('Restringido')

    if sale.type == 'Torneo':
        #Obteniendo información del torneo y equipo del cliente
        team = Team.objects.all().filter(user_id=sale.user_id).first()
        intermediate_tournament = get_object_or_404(SaleTournament, sale_id=sale.id)
        tournament = intermediate_tournament.tournament

        #Agregando a tabla intermedia el equipo en el torneo del jugador
        new_tournament_team = TournamentTeam(team_id=team.id, tournament_id=tournament.id)
        new_tournament_team.save()

        user.range += 300
        user.save()

    if sale.type == 'Reserva':
        user.range += 120
        user.save()

    if sale.type == 'Productos':
        sale_car = get_object_or_404(SaleCar, sale_id=sale.id)
        cars_inventorys = CarInventory.objects.all().filter(car_id=sale_car.car.id)
        for car_inventory in cars_inventorys:
            car_inventory.inventory.quantity_reserved -= car_inventory.quantity
            car_inventory.inventory.save()
        output = Output(
            type='compra',
            total_products=sale_car.car.total_products,
            car =sale_car.car,
            )
        output.save()
        
        #Dando puntos al usuario
        points = 35 * sale_car.car.total_products
        user.range += points
        user.save()
        
    sale.status = 'Comprado'
    sale.save()

    messages.success(request, f'<i class="fa-solid fa-circle-check fa-bounce fa-xs"></i> Venta confirmada')
    return redirect(f'/sale/information/{sale_id}')

#Compra cancelada
@login_required
def sale_cancel(request, sale_id):
    sale = Sale.objects.all().filter(id=sale_id).first()
    if not request.user.is_staff:
        #Verificando que un usuario no está cancelando algo no suyo
        if not sale.user_id == request.user.id:
            raise Http404('Restringido')
    
    if sale.type == 'Productos':
        sale_car = get_object_or_404(SaleCar, sale_id=sale.id)
        cars_inventorys = CarInventory.objects.all().filter(car_id=sale_car.car.id)
        for car_inventory in cars_inventorys:
            car_inventory.inventory.quantity_reserved -= car_inventory.quantity
            car_inventory.inventory.product_quantity += car_inventory.quantity
            car_inventory.inventory.save()
            
    sale.status = 'Cancelado'
    sale.save()

    messages.error(request, f'<i class="fa-solid fa-circle-xmark fa-bounce"></i> Venta cancelada')
    return redirect(f'/sale/information/{sale_id}')

#------------------Productos-----------------------
#Productos
def store(request):
    if not request.user.is_authenticated:
        return redirect('signin')
    
    if request.user.is_staff:
        return redirect('inventory')

    #Creando carrito si el usuario no lo tiene
    car = Car.objects.all().filter(user_id=request.user.id, active=True)
    if not car.exists():
        new_car = Car(user_id=request.user.id)
        new_car.save()
        car = new_car
    car = Car.objects.all().filter(user_id=request.user.id, active=True).first()

    cars_inventorys = CarInventory.objects.filter(car_id=car.id).all()
    inventorys = Inventory.objects.all().filter(disabled=False)

    # Comparando para que fechas de vencimiento próximas no se muestren
    today = timezone.now().date()
    available_dates = [0]
    due_dates = [0]
    for inventory in inventorys:
        comparation = inventory.product.due_date - today
        if comparation > timezone.timedelta(days=7):
            available_dates.append(inventory.id)
            continue
        else:
            due_dates.append(inventory.id)
            continue
    
    # Eliminando productos con fecha vencida del carrito
    for due_date in due_dates:
        for car_inventory in cars_inventorys:
            if car_inventory.inventory.id == due_date:
                car.total_products -= car_inventory.quantity
                car.cost -= car_inventory.inventory.product.cost * car_inventory.quantity
                car.save()
                car_inventory.delete()
    
    return render(request, 'store.html', {'inventorys':inventorys, 'cars_inventorys':cars_inventorys, 'car':car, 'available_dates':available_dates})

def store_product_add(request):
    car = Car.objects.all().filter(user_id=request.user.id, active=True).first()

    if request.method == 'POST':
        data = request.body
        inventory_id_data = ""
        response_data = f'{data}'
        for caracter in response_data:
            if caracter.isdigit():
                inventory_id_data = f'{inventory_id_data}{caracter}'

        inventory = Inventory.objects.all().filter(id=int(inventory_id_data)).first()

        #Detectando si existe el carritoInventario
        car_inventory = CarInventory.objects.all().filter(car_id=car.id, inventory_id=inventory.id)
        if not car_inventory.exists():
            car_inventory = CarInventory(car_id=car.id, inventory_id=inventory.id)
            car_inventory.save()
        
        car_inventory = CarInventory.objects.all().filter(car_id=car.id, inventory_id=inventory.id).first()

        #Guardando cantidad
        if car_inventory.quantity < 5 and car_inventory.quantity < inventory.product_quantity:
            car_inventory.quantity += 1
            car_inventory.save()
            #Actualizando carrito
            car.total_products += 1
            car.cost += inventory.product.cost
            car.save()

        return JsonResponse({'result': f'{inventory_id_data}'})
    
    else:
        return JsonResponse({'error': 'Solo se aceptan solicitudes asincronas'})

def store_product_del(request):
    car = Car.objects.all().filter(user_id=request.user.id, active=True).first()
    if request.method == 'POST':
        data = request.body
        inventory_id_data = ""
        response_data = f'{data}'
        for caracter in response_data:
            if caracter.isdigit():
                inventory_id_data = f'{inventory_id_data}{caracter}'

        inventory = Inventory.objects.all().filter(id=int(inventory_id_data)).first()

        #Detectando si existe el carritoInventario
        car_inventory = CarInventory.objects.all().filter(car_id=car.id, inventory_id=inventory.id)
        if not car_inventory.exists():
            car_inventory = CarInventory(car_id=car.id, inventory_id=inventory.id)
            car_inventory.save()
        
        car_inventory = CarInventory.objects.all().filter(car_id=car.id, inventory_id=inventory.id).first()

        #Quitando cantidad
        car_inventory.quantity -= 1
        car_inventory.save()

        car.total_products -= 1
        car.cost -= inventory.product.cost
        car.save()

        if car_inventory.quantity <= 0:
            car_inventory.delete()

        return JsonResponse({'result': f'{inventory_id_data}'})
    
    else:
        return JsonResponse({'error': 'Solo se aceptan solicitudes asincronas'})

#------------------Inventario-----------------------
@login_required
def inventory(request):
    products = Product.objects.all()
    form = ProductForm()
    inventorys = Inventory.objects.all().filter(disabled=False)
    form2 = InventoryForm()
    today = timezone.now().date()
    due_dates = [0]

    for inventory in inventorys:
        comparation = inventory.product.due_date - today
        if comparation <= timezone.timedelta(days=7):
            due_dates.append(inventory.id)
            
    if request.method == 'POST':
        form = ProductForm(request.POST)
        form = InventoryForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('inventory')

    return render(request, 'inventario/inventory.html', {'products':products, 'form':form, 'inventorys':inventorys, 'form2':form2, 'due_dates':due_dates})

#Cantidad de producto
@login_required
def quantity_product(request, pk, add='True'):
    inventorys = Inventory.objects.all().filter(product_id=pk).first()
    form = InventoryForm()
    product_name = inventorys.product.name
    
    if request.method == 'POST':
        form = InventoryForm(request.POST)
        
        if form.is_valid():
            product_quantity = form.cleaned_data['product_quantity']

            # En caso de que se agreguen productos
            if add == 'True':
                inventorys.product_quantity += product_quantity
                inventorys.save()
                entry = Entry(total_products=product_quantity, inventory_id=inventorys.id)
                entry.save()
                messages.success(request, f'<i class="fa-solid fa-circle-check fa-bounce fa-xs"></i> Se han agregado {product_quantity} productos de {product_name}')
                
            # En caso de que se quiten productos
            else:
                inventorys.product_quantity -= product_quantity
                if inventorys.product_quantity < 0:
                    messages.error(request, f'<i class="fa-solid fa-triangle-exclamation fa-bounce fa-xs"></i> Estás quitando más de lo que hay')
                    return redirect(f'/quantity-product/{pk}/{add}')
                
                inventorys.save()
                output = Output(
                    total_products=product_quantity, 
                    inventory_id=inventorys.id, 
                    )
                output.save()

                # En caso tal de que los productos sean menores a 5 se deberá actualizar los carritos de los clientes para evitar conflictos
                cars = Car.objects.all().filter(active=True)
                if inventorys.product_quantity < 5:
                        for car in cars:
                            cars_inventorys2 = CarInventory.objects.all().filter(car_id=car.id)
                            for car_inventory2 in cars_inventorys2:
                                if car_inventory2.inventory_id == inventorys.id:

                                    # Se cambia cantidad en tabla intermedia
                                    actual_quantity = car_inventory2.quantity
                                    car_inventory2.quantity = inventorys.product_quantity
                                    car_inventory2.save()

                                    # Se cambia cantidad total y precio en carrito
                                    car_inventory2.car.total_products -= (actual_quantity - inventorys.product_quantity)
                                    car_inventory2.car.cost -= inventorys.product.cost * (actual_quantity - inventorys.product_quantity)
                                    car_inventory2.car.save()

                                    if car_inventory2.quantity <= 0:
                                        car_inventory2.delete()
                                    continue

                messages.success(request, f'<i class="fa-solid fa-circle-check fa-bounce fa-xs"></i> Se han eliminado {product_quantity} productos de {product_name}')
            return redirect('inventory')
        
        else:
            messages.error(request, '<i class="fa-solid fa-triangle-exclamation fa-bounce fa-xs"></i> No puede haber cantidades negativas')
            return redirect(f'/quantity-product/{pk}/{add}')

    return render(request, 'inventario/quantity_product.html', {'form': form, 'product_name': product_name, 'add': add, 'inventory': inventorys})

#Crear producto
@login_required
def create_product(request):
    if request.method == 'POST':
        form = ProductForm(request.POST, request.FILES)

        if form.is_valid():
            new_product = form.save(commit=False)
            new_product.save()
            
            new_inventory = Inventory(product_id=new_product.id)
            new_inventory.save()

            messages.success(request, f'<i class="fa-solid fa-circle-check fa-bounce fa-xs"></i> El producto {new_product.name} ha sido creado con éxito')
            return redirect('inventory')
        else:
            return HttpResponse(form.errors)
    else:
        form = ProductForm()

    return render(request, 'inventario/create_product.html', {'form': form})

#Crear categoría
@login_required
def create_category(request):
    if request.method == 'POST':
        form = CategoryForm(request.POST, request.FILES)
        
        if form.is_valid():
            new_category = form.save(commit=False)
            new_category.save()

            messages.success(request, f'<i class="fa-solid fa-circle-check fa-bounce fa-xs"></i> La categoria {new_category.name} ha sido creada')
            return redirect('inventory')
        else:
            return HttpResponse(form.errors)
        
    else:
        form = CategoryForm()

    return render(request, 'inventario/create_category.html', {'form': form})


#Editar producto
@login_required
def edit_product(request, pk):
    product = Product.objects.get(pk=pk)
    cost = str(product.cost)[:-2]
    cost = int(cost)
    form = EditProductForm(instance=product, initial={'cost': cost})
    
    if request.method == 'POST':
        form = EditProductForm(request.POST, request.FILES, instance=product, initial={'cost': cost})
        if form.is_valid():
            form.save()
            messages.success(request, f'<i class="fa-solid fa-circle-check fa-bounce fa-xs"></i> El producto {product.name} ha sido editado')
            return redirect('inventory')
        else:
            raise Http404(form.errors)
    
    return render(request, 'inventario/edit_product.html', {'form': form})

#Eliminar producto
@login_required
def delete_product(request, pk):
    product = Product.objects.get(pk=pk)
    inventory = Inventory.objects.all().filter(product=pk).first()
    
    if request.method == 'POST':
        messages.success(request, f'<i class="fa-solid fa-circle-check fa-bounce fa-xs"></i> El producto {product.name} ha sido eliminado')
        inventory.disabled = True
        inventory.save()
        return redirect('inventory')
    
    return render(request, 'inventario/delete_product.html', {'product': product})

#-------------------Torneos-----------------------
#Torneos
def tournament(request):
    #Si el usuario está registrado, entonces buscará coincidencias
    if not request.user.is_authenticated:
        return redirect('signin')

    user = get_object_or_404(UserBoli, id=request.user.id)
    sales = Sale.objects.all().filter(type='Torneo',user_id=user.id)
    tournaments = Tournament.objects.all().order_by('-active')
    sales_tournaments_all = SaleTournament.objects.all()

    if request.user.is_authenticated:
        has_team = Team.objects.filter(user=request.user).exists()
    else:
        has_team = False

    if has_team:
        team = get_object_or_404(Team, user_id=request.user.id)
    else:
        team = False
     
    sales_tournaments = []
    no_tournaments = []

    # Torneos en proceso de compra del cliente
    for sale in sales:
        for tournament in tournaments:
            for sale_tournament_all in sales_tournaments_all:
                if sale_tournament_all.sale_id == sale.id and sale_tournament_all.tournament_id == tournament.id:
                    sales_tournaments.append(SaleTournament.objects.all().filter(sale_id=sale.id, tournament_id=tournament.id).first())

    # Verificando ids que ya están comprados por el cliente
    tournaments_ids = []
    tournaments_ids_deletes = []
    for tournament in tournaments:
        tournaments_ids.append(tournament.id)

    for sale_tournament in sales_tournaments:
        tournaments_ids_deletes.append(sale_tournament.tournament.id)

    # Torneos agenos al cliente
    for deleted in tournaments_ids_deletes:
        index = tournaments_ids.index(deleted)
        tournaments_ids.pop(index)

    for tournament_id in tournaments_ids:
        no_tournaments.append(Tournament.objects.all().filter(id=tournament_id).first())

    # Verificando si se encuentra en torneo actualmente
    has_tournament = False
    for sale_tournament in sales_tournaments:
        if (sale_tournament.sale.status == 'En proceso...' and sale_tournament.tournament.active) or (sale_tournament.sale.status == 'Comprado' and sale_tournament.tournament.active):
            has_tournament = True
            break
    
    # Formulario para crear torneo por parte del admin
    if request.method == 'POST':
        form = TournamentCreateForm(request.POST)
        if form.is_valid():
            form.save()
            name = form.cleaned_data['name']
            messages.success(request, f'<i class="fa-solid fa-circle-check fa-bounce fa-xs"></i> El torneo {name} ha sido creado')
            return redirect('tournament')
    else:
        form = TournamentCreateForm()

    return render(request, 'tournament.html', {'has_team':has_team, 'team':team, 'sales_tournaments':sales_tournaments, 'tournaments':tournaments, 'has_tournament':has_tournament, 'no_tournaments':no_tournaments, 'form':form})

@login_required
def tournament_cancel(request, tournament_id):
    if not request.user.is_staff:
        raise Http404('Restringido')

    tournament = get_object_or_404(Tournament, id=tournament_id)
    tournament.active = False
    tournament.save()

    #Quitando tarjetas de los jugadores al finalizar el torneo
    tournaments_teams = TournamentTeam.objects.all().filter(tournament_id=tournament_id)
    for tournament_team in tournaments_teams:
        players = Player.objects.all().filter(team_id=tournament_team.team.id)
        for player in players:
            player.yellow_card = 0
            player.blue_card = 0
            player.red_card = 0
            player.save()

    messages.info(request, '¡TORNEO FINALIZADO!')
    return redirect('tournament')

#Torneo y equipos
@login_required
def tournament_teams(request, tournament_id):
    user = request.user
    teams = TournamentTeam.objects.all().filter(tournament_id=tournament_id)
    tournament = get_object_or_404(Tournament, id=tournament_id)

    if request.method == 'POST':
        intermediate_id = request.POST.get('intermediate_id', '')
        team_form = get_object_or_404(TournamentTeam, id=intermediate_id)
        form = TournamentTeamForm(request.POST, instance=team_form)

        if form.is_valid():
            team_form.goals_diff = form.cleaned_data['goals_for'] - form.cleaned_data['goals_against']
            if team_form.goals_diff < 0:
                team_form.goals_diff *= -1

            team_form.games_played = form.cleaned_data['games_tied'] + form.cleaned_data['games_won'] + form.cleaned_data['games_lost']

            team_form.score = form.cleaned_data['games_tied'] * 1 + form.cleaned_data['games_won'] * 3 + form.cleaned_data['games_lost'] * 0

            form.save()

        messages.success(request, f'<i class="fa-solid fa-circle-check fa-bounce fa-xs"></i> Las estadísticas del equipo {team_form.team.name} han sido modificadas')
        return redirect(f'/tournament/teams/{tournament_id}/')
    else:
       form = TournamentTeamForm()

    return render(request, 'tournament/tournament_team.html', {'teams':teams, 'user':user, 'tournament':tournament,'form':form})

#Inscripción a torneo
@login_required
def tournament_players(request, tournament_id, team_id):
    user = request.user
    if not user.is_staff:
        raise Http404('restringido')

    players = Player.objects.all().filter(team_id=team_id)
    team = get_object_or_404(Team, id=team_id)
    tournament = Tournament.objects.all().filter(id=tournament_id).first()
    form = CardPlayerForm()

    if request.method == 'POST':
        player_id = request.POST.get('player_id', '')
        player = get_object_or_404(Player, id=player_id)
        form = CardPlayerForm(request.POST, instance=player)
        if form.is_valid():
            form.save()

        if player.gender == "Femenino":
            messages.success(request, f'<i class="fa-solid fa-circle-check fa-bounce fa-xs"></i> Se ha modificado las tarjetas de la jugadora {player.name}')
        elif player.gender == "Masculino":
            messages.success(request, f'<i class="fa-solid fa-circle-check fa-bounce fa-xs"></i> Se ha modificado las tarjetas del jugador {player.name}')
        else:
            messages.success(request, f'<i class="fa-solid fa-circle-check fa-bounce fa-xs"></i> Se ha modificado las tarjetas de l@ jugador@ {player.name}')

        return redirect(f'/tournament/teams/{tournament_id}/{team_id}/')

    return render(request, 'tournament/tournament_player.html', {'players':players, 'team':team, 'form':form, 'tournament':tournament})

#Equipo
@login_required
def team(request):
    team = Team.objects.all().filter(user_id=request.user.id)
    if team.exists():
        raise Http404('No puedes tener más de dos equipos')

    if request.method == 'POST':
        form = TeamForm(request.POST, request.FILES)
        if form.is_valid():
            team = form.save(commit=False)
            team.user = request.user
            team.save()

            return redirect('tournament')
    else:
        form = TeamForm()

    return render(request, 'tournament/team.html', {'form':form})

@login_required
def team_edit(request, team_id):
    team_inf = get_object_or_404(Team, id=team_id)
    
        #Verificando que no esté en un torneo
    user = get_object_or_404(UserBoli, id=request.user.id)
    sales = Sale.objects.all().filter(type='Torneo', user_id=user.id)
    sales_tournaments = []
    for sale in sales:
        sales_tournaments.append(SaleTournament.objects.all().filter(sale_id=sale.id).first())
    has_tournament = False
    for sale_tournament in sales_tournaments:
        if (sale_tournament.sale.status == 'En proceso...' and sale_tournament.tournament.active) or (sale_tournament.sale.status == 'Comprado' and sale_tournament.tournament.active):
            has_tournament = True
            break

    if request.method == 'POST':
        form = TeamForm(request.POST, request.FILES, instance=team_inf)
        if form.is_valid():
            form.save()
            messages.success(request, f'<i class="fa-solid fa-circle-check fa-bounce fa-xs"></i> Se ha hecho el cambio del equipo')
            return redirect('tournament')
    else:
        form = TeamForm()

    return render(request, 'tournament/team.html', {'form':form, 'team_inf':team_inf, 'has_tournament':has_tournament})

@login_required
def player(request):
    #Consiguiendo información del equipo a la que va a pertencer el player
    user = request.user
    team = get_object_or_404(Team, user_id=user.id)
    
    #Verificando que no esté en un torneo
    sales = Sale.objects.all().filter(type='Torneo', user_id=user.id)
    sales_tournaments = []
    for sale in sales:
        sales_tournaments.append(SaleTournament.objects.all().filter(sale_id=sale.id).first())

    has_tournament = False
    for sale_tournament in sales_tournaments:
        if (sale_tournament.sale.status == 'En proceso...' and sale_tournament.tournament.active) or (sale_tournament.sale.status == 'Comprado' and sale_tournament.tournament.active):
            has_tournament = True
            break

    #Si hay jugadores entonces muestra la información de ese jugador
    if Player.objects.all().filter(team_id=team.id).exists():
        players = Player.objects.all().filter(team_id=team.id)
    else:
        players = ""

    if request.method == 'POST':
        form = PlayerForm(request.POST)
        if team.players_num >= 15:
            messages.error(request, '<i class="fa-solid fa-triangle-exclamation fa-bounce fa-xs"></i> Máximo de jugadores')
            return redirect('player')

        if form.is_valid():
            player = form.save(commit=False)
            player.team_id = team.id
            team.players_num += 1
            team.save()
            player.save()

            messages.success(request, f'<i class="fa-solid fa-circle-check fa-bounce fa-xs"></i> Se ha agregado el jugador {player.name} al equipo')
            return redirect('player')
    else:
        form = PlayerForm()

    return render(request, 'tournament/player.html', {'form':form, 'team':team, 'players':players, 'has_tournament':has_tournament})

@login_required
def player_edit(request, player_id):
    #Consiguiendo información del equipo a la que va a pertencer el player
    user = request.user
    player_inf = get_object_or_404(Player, id=player_id)
    team = get_object_or_404(Team, user_id=user.id)

    #Verificando que no esté en un torneo
    sales = Sale.objects.all().filter(type='Torneo', user_id=user.id)
    sales_tournaments = []
    for sale in sales:
        sales_tournaments.append(SaleTournament.objects.all().filter(sale_id=sale.id).first())

    has_tournament = False
    for sale_tournament in sales_tournaments:
        if (sale_tournament.sale.status == 'En proceso...' and sale_tournament.tournament.active) or (sale_tournament.sale.status == 'Comprado' and sale_tournament.tournament.active):
            has_tournament = True
            break

    #Comprobando que el jugador que se va a editar pertenezca al equipo consultado
    if team.id != player_inf.team_id:
        raise Http404('Ha ocurrido un error')

    #Si hay jugadores entonces muestra la información de ese jugador
    if Player.objects.all().filter(team_id=team.id).exists():
        players = Player.objects.all().filter(team_id=team.id)
    else:
        players = ""

    if request.method == 'POST':
        form = PlayerForm(request.POST, instance=player_inf)
        if form.is_valid():
            form.save()

            messages.success(request, f'<i class="fa-solid fa-circle-check fa-bounce fa-xs"></i> Se ha hecho el cambio')
            url = reverse('player_edit', args=[player_id])
            return redirect(url)
    else:
        form = PlayerForm()

    return render(request, 'tournament/player.html', {'form':form, 'team':team, 'players':players, 'player_inf':player_inf, 'has_tournament':has_tournament})

#------------------Reservas---------------------------
#Reservas
def reserve(request):
    if not request.user.is_authenticated:
        return redirect('signin')
    
    user = get_object_or_404(UserBoli, id=request.user.id) 
    if request.method == 'POST':
        form = ReserveCalendarForm(request.POST)
        if form.is_valid():
            disponibility = form.cleaned_data['date']
            calendars = Calendar.objects.all()
            for calendar in calendars:
                if disponibility == calendar.date:
                    messages.info(request, '<i class="fa-solid fa-triangle-exclamation fa-bounce fa-xs"></i> La fecha ya ha sido puesta')
                    return redirect('reserve')
            
            form.save()
            messages.success(request, '<i class="fa-solid fa-circle-check fa-bounce fa-xs"></i> Día no disponible establecido')
            return redirect('reserve')
    else:
        form = ReserveCalendarForm()
    
    return render(request, 'reserve.html', {'user':user, 'form':form})

#--------------------Inicio---------------------------
#Inicio
def index(request):    
    comments = Comment.objects.all().order_by('-date')

    if request.user.is_authenticated:
        user = get_object_or_404(UserBoli, id=request.user.id)
        likes = Like.objects.all()
        comments_likes = []
        comments_no_likes = []

        #Comentarios likeados por el usuario
        for like in likes:
            if like.user_id == user.id:
                comments_likes.append(like.comment_id)

        #Comentarios no likeados
        for comment in comments:
            comments_no_likes.append(comment.id)

            for comment_like in comments_likes:
                if (comment.id == comment_like):
                    comments_no_likes.pop()
                    break
    else:
        user = False
        comments_likes = False
        comments_no_likes = False

    inventorys = Inventory.objects.all().filter(disabled=False).order_by('-product_quantity')[:5]

    form_comment = CommentForm()

    if request.method == 'POST':
        form_comment = CommentForm(request.POST)

        if form_comment.is_valid():
            #Creando comentario
            new_comment = Comment(text = form_comment.cleaned_data['text'], user_id=request.user.id)
            new_comment.save()
            messages.success(request, '<i class="fa-solid fa-circle-check fa-bounce fa-xs"></i> Comentario publicado')
            return redirect('index')
        
        else:
            messages.error(request, f'<i class="fa-solid fa-triangle-exclamation fa-bounce fa-xs"></i> Comentario no válido, mínimo 10 caracteres')
            return redirect('index')

    return render(request, 'index.html', {'user': user, 'inventorys':inventorys, 'form_comment': form_comment, 'comments': comments, 'comments_likes': comments_likes, 'comments_no_likes': comments_no_likes})

# Fetch para los likes
def add_like(request):
    if request.method == 'POST':
        data = request.body
        comment_id_data = ""
        response_data = f'{data}'
        for caracter in response_data:
            if caracter.isdigit():
                comment_id_data = f'{comment_id_data}{caracter}'
        comment_id_data = int(comment_id_data)

        #Obteniendo informaición para determinar si puso o no un like en ese comentario
        like = Like.objects.all().filter(comment_id=comment_id_data, user_id=request.user.id)

        if (not like.exists()):
            new_like = Like(comment_id=comment_id_data, user_id=request.user.id)
            new_like.save()
            comment = get_object_or_404(Comment, id=comment_id_data)
            comment.score += 1
            comment.save()
        
        return JsonResponse({'res': f'{comment_id_data}'})
    else:
        return JsonResponse('Error', 'Error')

def del_like(request):
    if request.method == 'POST':
        data = request.body
        comment_id_data = ""
        response_data = f'{data}'
        for caracter in response_data:
            if caracter.isdigit():
                comment_id_data = f'{comment_id_data}{caracter}'
        comment_id_data = int(comment_id_data)

        #Obteniendo informaición para determinar si puso o no un like en ese comentario
        like = Like.objects.all().filter(comment_id=comment_id_data, user_id=request.user.id)

        if (like.exists()):
            like = like.first()
            comment = get_object_or_404(Comment, id=comment_id_data)
            comment.score -= 1
            comment.save()
            like.delete()

        return JsonResponse({'res': f'{comment_id_data}'})
    else:
        return JsonResponse('Error', 'Error')

#------------------------Cuenta de usuario----------------
#Perfil
@login_required
def profile(request):
    userForm = request.user

    if userForm.is_staff == 1:
        shoppings = Sale.objects.all().order_by('-date')[:5]
    else:
        shoppings = Sale.objects.all().filter(user_id=userForm.id).order_by('-date')[:7]

    if request.method == 'POST':
        form = EditProfileForm(request.POST, request.FILES, instance=userForm)
        old_avatar = userForm.avatar

        if form.is_valid():
            #Actualizando foto de perfil y borrando la anterior
            new_avatar = form.cleaned_data['avatar']

            #Si la antigua es la de defecto entonces no la elimina
            if old_avatar == 'exampleUser.png':
                userForm.avatar = new_avatar
                form.save()
                return redirect('profile')
            
            #Eliminando antigua
            if new_avatar != old_avatar:
                old_avatar_path = os.path.join(settings.MEDIA_ROOT, str(old_avatar))
                if os.path.exists(old_avatar_path):
                    os.remove(old_avatar_path)
            #Agregando nuevo avatar
            userForm.avatar = new_avatar
            form.save()

            messages.success(request, '<i class="fa-solid fa-circle-check fa-bounce fa-xs"></i> Cambios guardados')
            return redirect('profile')
    else:
        form = EditProfileForm(instance=userForm)

    user = get_object_or_404(UserBoli, id=request.user.id)
    return render(request, 'profile.html', {'user': user, 'form': form, 'shoppings':shoppings})

#Cambio de contraseña
@login_required
def change_password(request):
    userForm = request.user
    if request.method == 'POST':
        form = ChangePasswordForm(request.POST, instance=userForm)
        if form.is_valid():
            old_pass = form.cleaned_data['old_password']
            pass1 = form.cleaned_data['password']
            pass2 = form.cleaned_data['password2']

            #Verificando contraseña encriptada para comparar
            authetication = authenticate(username = userForm.username, password = old_pass)

            if not authetication or pass1 != pass2:
                messages.error(request, '<i class="fa-solid fa-triangle-exclamation fa-bounce fa-xs"></i> Alguna contraseña<br>no coincide...')

                return redirect('change_password')
                
            userForm.set_password(form.cleaned_data["password"])
            form.save()
            messages.success(request, '<i class="fa-solid fa-circle-check fa-bounce fa-xs"></i>Cambio con éxito<br>Vuelva a iniciar sesión')

            return redirect('signin')
    else:
        form = ChangePasswordForm()
    return render(request, 'profile_change_pass/change-password.html', {'form': form})

#Iniciar sesión
def signin(request):
    if request.method == 'POST':
        form = CustomSigninForm(request, data=request.POST)
        username = request.POST.get('username')
        password = request.POST.get('password')
        user = authenticate(username=username, password=password)
        if user is not None:
            login(request, user)
            userInf = request.user
            messages.success(request, f'<i class="fa-solid fa-user"></i> Bienvenid{userInf.pronoun()} {userInf.first_name}')
            return redirect('index')
        else:
            messages.error(request, '<i class="fa-solid fa-triangle-exclamation fa-bounce fa-xs"></i> Datos inválidos')
            return redirect('signin')
    
    form = CustomSigninForm()
    return render(request, 'signin.html', {'form': form})

#Cerrar sesión
def signout(request):
    logout(request)
    return redirect('index')

#Registro
def register(request):
    if request.method == 'POST':
        form = CustomUserForm(request.POST, request.FILES)
        if form.is_valid():
            pass1 = form.cleaned_data['password1']
            pass2 = form.cleaned_data['password2']

            if pass1 != pass2:
                #En caso de que no coincidan las contraseñas
                messages.error(request, '<i class="fa-solid fa-triangle-exclamation fa-bounce fa-xs"></i> Las contraseñas no coinciden<br>')
            else:
                user = form.save()
                user.set_password(form.cleaned_data["password"])
                user.save()

                login(request, user)
                messages.success(request, f'<i class="fa-solid fa-circle-check"></i> Cuenta creada con éxito, bienvenid{request.user.pronoun()} {request.user.first_name}')
                return redirect('index')
        else:
            #Si el formulario no es válido es porque el email ya existe
            messages.error(request, '<i class="fa-solid fa-triangle-exclamation fa-bounce fa-xs"></i> El correo puesto ya existe<br>')
    else:
        form = CustomUserForm()

    return render(request, 'register.html', {'form': form})

#Términos y condiciones
def terms(request):
    return render(request, 'terms/terms.html', {})