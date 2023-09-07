from django.shortcuts import render
from django.shortcuts import redirect
from django.contrib.auth import login
from django.contrib.auth import authenticate
from django.contrib import messages
from user.forms import CustomUserForm

def index(request):
    return render(request, 'index.html', {})

def signin(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        user = authenticate(username=username, password=password)
        if user:
            login(request, user)
            messages.success(request, 'Bienvenido {}'.format(user.username))
            return redirect('signin')
        else: 
            messages.error(request, 'Usuario o contraseña incorrectos')
    return render(request, 'signin.html',{})

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