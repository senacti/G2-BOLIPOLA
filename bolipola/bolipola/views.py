from django.shortcuts import render, get_object_or_404
from user.forms import EditProfileForm
from django.shortcuts import redirect
from django.contrib.auth import login, logout
from django.contrib.auth import authenticate
from django.contrib import messages
from user.forms import CustomUserForm, CustomSigninForm
from user.models import UserBoli

def index(request):
    if request.user.is_authenticated:
        user = get_object_or_404(UserBoli, pk=request.user.pk)
    else:
        user = False
        
    return render(request, 'index.html', {'user': user})

def profile(request):
    userForm = request.user
    if request.method == 'POST':
        form = EditProfileForm(request.POST, request.FILES, instance=userForm)
        if form.is_valid():
            userForm.username = form.cleaned_data['email']
            userForm.avatar = form.cleaned_data['avatar']
            form.save()

            return redirect('profile')
    else:
        form = EditProfileForm(instance=userForm)

    user = get_object_or_404(UserBoli, pk=request.user.pk)
    return render(request, 'profile.html', {'user': user, 'form': form})

def signin(request):
    if request.method == 'POST':
        form = CustomSigninForm(request, data=request.POST)
        username = request.POST.get('username')
        password = request.POST.get('password')
        user = authenticate(username=username, password=password)
        if user is not None:
            login(request, user)
            messages.success(request, f'Bienvenido {username}')
            if user.is_staff:
                return redirect('admin:index')
            else:
                return redirect('index')
        else:
            pass
            
    form = CustomSigninForm()
    return render(request, 'signin.html', {'form': form})

def signout(request):
    logout(request)
    return redirect('index')

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