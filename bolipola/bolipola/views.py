import os
import pytz
from . import settings
from django.utils.timezone import now
from django.http import Http404, HttpResponse
from django.urls import reverse
from django.shortcuts import render, get_object_or_404
from django.shortcuts import redirect
from django.contrib.auth import login, logout, authenticate
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from core.forms import TeamForm, PlayerForm, SaleForm, InventoryForm, ProductForm, CategoryForm, TournamentTeamForm, CardPlayerForm
from user.forms import CustomUserForm, CustomSigninForm, ChangePasswordForm, EditProfileForm
from user.models import UserBoli
from core.models import Team, Player, Tournament, TournamentTeam, Product, Reservation, Sale, SaleTournament, SaleReservation, SaleInventory, Inventory, Category

#------------------Ventas---------------------------
#Venta
@login_required
def sale(request, type_id, type_name):
    #Detectando que tipo de venta es
    if type_name == 'Torneo':
        inf = get_object_or_404(Tournament, id=type_id)
        team = get_object_or_404(Team, user_id=request.user.id)
        if team.players_num < 11:
            messages.error(request, '<i class="fa-solid fa-triangle-exclamation fa-bounce fa-xs"></i> Sin jugadores suficientes, mínimo 11 para un torneo')
            return redirect('tournament')
    if type_name == 'Productos':
        inf = get_object_or_404(Product, id=type_id)

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
                intermediate = SaleInventory(sale_id=sale.id, inventory_id=inf.id)
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

    return render(request, 'sale.html', {'form':form, 'type_name':type_name, 'inf':inf})

#Información de la venta
@login_required
def sale_information(request, sale_id):
    user = get_object_or_404(UserBoli, id=request.user.id)
    sale = get_object_or_404(Sale, id=sale_id)
    team = False

    if sale.type == 'Torneo':
        inf = get_object_or_404(SaleTournament, sale_id=sale.id)  
        inf = inf.tournament
        team = Team.objects.all().filter(user_id=sale.user_id).first()

    if sale.type == 'Productos':
        inf = get_object_or_404(SaleInventory, sale_id=sale.id)   
        inf = inf.inventory

    if sale.type == 'Reserva':
        inf = get_object_or_404(SaleReservation, sale_id=sale.id)
        inf = inf.reservation

    return render(request, 'sale/sale_information.html', {'user':user, 'sale':sale, 'inf':inf, 'team':team})

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

    sale.status = 'Cancelado'
    sale.save()

    messages.error(request, f'<i class="fa-solid fa-circle-xmark fa-bounce"></i> Venta cancelada')
    return redirect(f'/sale/information/{sale_id}')

#------------------Productos-----------------------
#Productos
def store(request):
    if not request.user.is_authenticated:
        return redirect('signin')
    
    inventorys = Inventory.objects.all()

    return render(request, 'store.html', {'inventorys':inventorys})

#inventario
@login_required
def inventory(request):
    products = Product.objects.all()
    form = ProductForm()
    inventorys = Inventory.objects.all()
    form2 = InventoryForm()

    if request.method == 'POST':
        form = ProductForm(request.POST)
        form = InventoryForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('inventory')
    
    return render(request, 'inventario/inventory.html', {'products':products, 'form':form, 'inventorys':inventorys, 'form2':form2})
 
#Cantidad de producto
@login_required
def quantity_product(request, pk):
    inventorys = Inventory.objects.all().filter(product_id=pk).first()
    form = InventoryForm(instance=inventorys)
 
    product_name = inventorys.product.name
    
    if request.method == 'POST':
        form = InventoryForm(request.POST, instance=inventorys)
        if form.is_valid():
            messages.success(request, f'<i class="fa-solid fa-circle-check fa-bounce fa-xs"></i> Se han agregado {form.cleaned_data["product_quantity"]} productos de {product_name}')
            form.save()
            return redirect('inventory')
        else:
            messages.error(request, '<i class="fa-solid fa-triangle-exclamation fa-bounce fa-xs"></i> No puede haber cantidades negativas')
            return redirect(f'/quantity-product/{pk}/')

    return render(request, 'inventario/quantity_product.html', {'form': form, 'product_name': product_name})

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
    form = ProductForm(instance=product)
    
    if request.method == 'POST':
        form = ProductForm(request.POST, request.FILES, instance=product)
        if form.is_valid():
            form.save()
            messages.success(request, f'<i class="fa-solid fa-circle-check fa-bounce fa-xs"></i> El producto {product.name} ha sido editado')
            return redirect('inventory')
    
    return render(request, 'inventario/edit_product.html', {'form': form})

#Eliminar producto
@login_required
def delete_product(request, pk):
    product = Product.objects.get(pk=pk)

    if request.method == 'POST':
        messages.success(request, f'<i class="fa-solid fa-circle-check fa-bounce fa-xs"></i> El producto {product.name} ha sido eliminado')
        product.delete()
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
    
    return render(request, 'tournament.html', {'has_team':has_team, 'team':team, 'sales_tournaments':sales_tournaments, 'tournaments':tournaments, 'has_tournament':has_tournament, 'no_tournaments':no_tournaments})

@login_required
def tournament_cancel(request, tournament_id):
    if not request.user.is_staff:
        raise Http404('Restringido')

    tournament = get_object_or_404(Tournament, id=tournament_id)
    tournament.active = False
    tournament.save()

    messages.warning(request, '¡TORNEO FINALIZADO!')
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
    return render(request, 'reserve.html', {'user':user})


#--------------------Inicio---------------------------
#Inicio
def index(request):
    if request.user.is_authenticated:
        user = get_object_or_404(UserBoli, id=request.user.id)
    else:
        user = False

    inventorys = Inventory.objects.all().order_by('-product_quantity')[:5]
    
    return render(request, 'index.html', {'user': user, 'inventorys':inventorys})


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