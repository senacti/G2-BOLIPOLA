from django.shortcuts import render
from django.http import Http404, HttpResponse
from django.shortcuts import redirect
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from bolipola.views import sale
from core.models import Calendar, Reservation
import datetime

@login_required
def bolirana(request):
    if request.method == 'POST':
        disponibility = request.POST.get('fecha', '')
        disponibility_to_date = datetime.datetime.strptime(disponibility, '%Y-%m-%d').date()
        place = request.POST.get('site', '')
        time_start = request.POST.get('hora-inicio', '')
        time_end = request.POST.get('hora-fin', '')
        cost = request.POST.get('cost', '')
        type = 'Bolirana'

        calendars = Calendar.objects.all()
        for calendar in calendars:
            if disponibility_to_date == calendar.date:
                messages.error(request, '<i class="fa-solid fa-triangle-exclamation fa-bounce fa-xs"></i> Fecha no disponible, elige otro día')
                return redirect('court_form')

        new_reservation = Reservation(place=place, type=type, date=disponibility_to_date, start_time=time_start, end_time=time_end, cost=cost)
        new_reservation.save()
        return redirect(f'/sale/{new_reservation.id}/{new_reservation.sale_type()}')

    return render(request, 'reserve_types/bolirana.html', {})

@login_required
def court(request):
    if request.method == 'POST':
        disponibility = request.POST.get('fecha', '')
        disponibility_to_date = datetime.datetime.strptime(disponibility, '%Y-%m-%d').date()
        place = request.POST.get('site', '')
        time_start = request.POST.get('hora-inicio', '')
        time_end = request.POST.get('hora-fin', '')
        cost = request.POST.get('cost', '')
        type = 'Cancha'

        calendars = Calendar.objects.all()
        for calendar in calendars:
            if disponibility_to_date == calendar.date:
                messages.error(request, '<i class="fa-solid fa-triangle-exclamation fa-bounce fa-xs"></i> Fecha no disponible, elige otro día')
                return redirect('court_form')

        new_reservation = Reservation(place=place, type=type, date=disponibility_to_date, start_time=time_start, end_time=time_end, cost=cost)
        new_reservation.save()
        return redirect(f'/sale/{new_reservation.id}/{new_reservation.sale_type()}')

    return render(request, 'reserve_types/court.html', {})

@login_required
def tables(request):
    if request.method == 'POST':
        disponibility = request.POST.get('fecha', '')
        disponibility_to_date = datetime.datetime.strptime(disponibility, '%Y-%m-%d').date()
        place = request.POST.get('site', '')
        time_start = request.POST.get('hora-inicio', '')
        time_end = request.POST.get('hora-fin', '')
        cost = request.POST.get('cost', '')
        type = 'Mesa'

        calendars = Calendar.objects.all()
        for calendar in calendars:
            if disponibility_to_date == calendar.date:
                messages.error(request, '<i class="fa-solid fa-triangle-exclamation fa-bounce fa-xs"></i> Fecha no disponible, elige otro día')
                return redirect('court_form')

        new_reservation = Reservation(place=place, type=type, date=disponibility_to_date, start_time=time_start, end_time=time_end, cost=cost)
        new_reservation.save()
        return redirect(f'/sale/{new_reservation.id}/{new_reservation.sale_type()}')

    return render(request, 'reserve_types/tables.html', {})