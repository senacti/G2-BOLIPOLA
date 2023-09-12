
from django.shortcuts import render

def bolirana(request):
    return render(request, 'reserve_types/bolirana.html', {})

def court(request):
    return render(request, 'reserve_types/court.html', {})

def tables(request):
    return render(request, 'reserve_types/tables.html', {})