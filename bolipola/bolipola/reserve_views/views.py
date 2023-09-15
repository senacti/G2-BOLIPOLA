from django.shortcuts import render
from django.contrib.auth.decorators import login_required

@login_required
def bolirana(request):
    return render(request, 'reserve_types/bolirana.html', {})

@login_required
def court(request):
    return render(request, 'reserve_types/court.html', {})

@login_required
def tables(request):
    return render(request, 'reserve_types/tables.html', {})