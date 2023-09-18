import os
from . import settings
from django.http import Http404
from django.urls import reverse
from django.shortcuts import render, get_object_or_404
from django.shortcuts import redirect
from django.contrib.auth import login, logout, authenticate
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from core.forms import TeamForm, PlayerForm
from user.forms import CustomUserForm, CustomSigninForm, ChangePasswordForm, EditProfileForm
from user.models import UserBoli
from core.models import Team, Player, Tournament

#------------------Productos-----------------------
#Productos
def store(request):
    return render(request, 'store.html', {})


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

    return render(request, 'tournament.html', {'has_team':has_team, 'team':team, 'tournaments':tournaments})

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
    return render(request, 'profile.html', {'user': user, 'form': form})

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