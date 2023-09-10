from django.shortcuts import render
from django.shortcuts import redirect
from django.contrib.auth import login, logout
from django.contrib.auth import authenticate
from django.contrib import messages
from user.forms import CustomUserForm, CustomSigninForm

def index(request):
    return render(request, 'index.html', {})

def profile(request):
    return render(request, 'profile.html', {})

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
        form = CustomUserForm(request.POST)
        if form.is_valid():
            user = form.save()

            user.set_password(form.cleaned_data["password"]) #Se encarga de encriptar la contraseña puesta
            user.save()

            return redirect('signin')
    else:
        form = CustomUserForm()

    return render(request, 'register.html', {'form': form})