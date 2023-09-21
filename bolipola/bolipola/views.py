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
from core.forms import TeamForm, PlayerForm, SaleForm, InventoryForm, ProductForm, CategoryForm
from user.forms import CustomUserForm, CustomSigninForm, ChangePasswordForm, EditProfileForm
from user.models import UserBoli
from core.models import Team, Player, Tournament, Event, Product,Reservation, Sale, SaleTournament, SaleReservation, SaleEvent, SaleInventory, Inventory, Category

#------------------Ventas---------------------------
def sale(request, type_id, type_name):

    #Detectando que tipo de venta es
    if type_name == 'Torneo':
        inf = get_object_or_404(Tournament, id=type_id)
        team = get_object_or_404(Team, user_id=request.user.id)
        if team.players_num < 11:
            messages.error(request, '<i class="fa-solid fa-triangle-exclamation fa-bounce fa-xs"></i> Sin jugadores suficientes, mínimo 11 para un torneo')
            return redirect('tournament')
    
    if type_name == 'Evento':
        inf = get_object_or_404(Event, id=type_id)

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
            if type_name == 'Evento':
                intermediate = SaleEvent(sale_id=sale.id, event_id=inf.id,)
            if type_name == 'Productos':
                intermediate = SaleInventory(sale_id=sale.id, inventory_id=inf.id,)
            if type_name == 'Reserva':
                intermediate = SaleReservation(sale_id=sale.id, reservation_id=inf.id)

            #Guardando tabla intermedia
            intermediate.save()
            messages.success(request, f'<i class="fa-solid fa-circle-check fa-bounce fa-xs"></i> Compra en proceso, consulta tu perfil 😄')
            return redirect('index')
    else:
        form = SaleForm()

    return render(request, 'sale.html', {'form':form, 'type_name':type_name, 'inf':inf})


#------------------Productos-----------------------
#Productos
def store(request):
    return render(request, 'store.html', {})

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
    
    return render(request, 'inventario/inventory.html', {'products': products, 'form': form,'inventorys': inventorys, 'form2': form2})
 
#Cantidad de producto
@login_required
def quantity_product(request, pk):
    inventorys = Inventory.objects.get(pk=pk)
    form = InventoryForm(instance=inventorys)
    
    if request.method == 'POST':
        form = InventoryForm(request.POST, instance=inventorys)
        if form.is_valid():
            form.save()
            return redirect('inventory')
    
    return render(request, 'inventario/quantity_product.html', {'form': form})

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
            return redirect('inventory')
    
    return render(request, 'inventario/edit_product.html', {'form': form})

#Eliminar producto
@login_required
def delete_product(request, pk):
    product = Product.objects.get(pk=pk)
    
    if request.method == 'POST':
        product.delete()
        return redirect('inventory')
    
    return render(request, 'inventario/delete_product.html', {'product': product})

#-------------------Torneos-----------------------
#Torneos
def tournament(request):
    #Si el usuario está registrado, entonces buscará coincidencias
    if request.user.is_authenticated:
        has_team = Team.objects.filter(user=request.user).exists()
    else:
        has_team = False

    if has_team:
        team = get_object_or_404(Team, user_id=request.user.id)
    else:
        team = False
     
    tournaments = Tournament.objects.all().filter(active=1)
    sale_id_user = Sale.objects.all().filter(user_id=request.user.id, type='Torneo').first()

    if sale_id_user: 
        has_tournament = SaleTournament.objects.all().filter(sale_id=sale_id_user.id).first()
    else:
        has_tournament = False
        
    return render(request, 'tournament.html', {'has_team':has_team, 'team':team, 'tournaments':tournaments, 'has_tournament':has_tournament})

#Inscripción a torneo
@login_required
def inscription(request):
    return render(request, 'tournament/inscription.html', {})

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

    if request.method == 'POST':
        form = TeamForm(request.POST, request.FILES, instance=team_inf)
        if form.is_valid():
            form.save()
            messages.success(request, f'<i class="fa-solid fa-circle-check fa-bounce fa-xs"></i> Se ha hecho el cambio del equipo')
            return redirect('tournament')
    else:
        form = TeamForm()

    return render(request, 'tournament/team.html', {'form':form, 'team_inf':team_inf})

@login_required
def player(request):
    #Consiguiendo información del equipo a la que va a pertencer el player
    user = request.user
    team = get_object_or_404(Team, user_id=user.id)

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

            return redirect('player')
    else:
        form = PlayerForm()

    return render(request, 'tournament/player.html', {'form':form, 'team':team, 'players':players})

@login_required
def player_edit(request, player_id):
    #Consiguiendo información del equipo a la que va a pertencer el player
    user = request.user
    player_inf = get_object_or_404(Player, id=player_id)
    team = get_object_or_404(Team, user_id=user.id)

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

    return render(request, 'tournament/player.html', {'form':form, 'team':team, 'players':players, 'player_inf':player_inf})

#------------------Reservas---------------------------
#Reservas
def reserve(request):
    return render(request, 'reserve.html', {})


#--------------------Inicio---------------------------
#Inicio
def index(request):
    if request.user.is_authenticated:
        user = get_object_or_404(UserBoli, id=request.user.id)
    else:
        user = False
        
    return render(request, 'index.html', {'user': user})


#------------------------Cuenta de usuario----------------
#Perfil
@login_required
def profile(request):
    userForm = request.user

    if userForm.is_staff == 1:
        shoppings = Sale.objects.all()
    else:
        shoppings = Sale.objects.all().filter(user_id=userForm.id)

    if request.method == 'POST':
        form = EditProfileForm(request.POST, request.FILES, instance=userForm)
        old_avatar = userForm.avatar

        if form.is_valid():
            userForm.username = form.cleaned_data['email']

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