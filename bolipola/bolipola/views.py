import os
from . import settings
from django.shortcuts import render, get_object_or_404
from django.http import HttpResponse
from django.shortcuts import redirect
from django.contrib.auth import login, logout, authenticate
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from user.forms import CustomUserForm, CustomSigninForm, ChangePasswordForm, EditProfileForm
from user.models import UserBoli

#Productos
def store(request):
    return HttpResponse('Página en construcción')

#Torneos
def tournament(request):
    return render(request, 'tournament.html', {})

#Reservas
def reserve(request):
    return render(request, 'reserve.html', {})

#Inicio
def index(request):
    if request.user.is_authenticated:
        user = get_object_or_404(UserBoli, pk=request.user.pk)
    else:
        user = False
        
    return render(request, 'index.html', {'user': user})

#Perfil
def profile(request):
    userForm = request.user
    if request.method == 'POST':
        form = EditProfileForm(request.POST, request.FILES, instance=userForm)
        old_avatar = userForm.avatar

        if form.is_valid():
            userForm.username = form.cleaned_data['email']

            #Actualizando foto de perfil y borrando la anterior
            new_avatar = form.cleaned_data['avatar']
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

    user = get_object_or_404(UserBoli, pk=request.user.pk)
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
                return redirect('change_password')
                
            userForm.set_password(form.cleaned_data["password"])
            form.save()
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
            messages.success(request, f'<i class="fa-solid fa-user"></i> Bienvenido {userInf.first_name}')
            
            if user.is_staff:
                return redirect('admin:index')
            else:
                return redirect('index')
        else:
            pass
            
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
            user = form.save()
            user.set_password(form.cleaned_data["password"]) #Se encarga de encriptar la contraseña puesta
            user.save()

            return redirect('signin')
    else:
        form = CustomUserForm()

    return render(request, 'register.html', {'form': form})