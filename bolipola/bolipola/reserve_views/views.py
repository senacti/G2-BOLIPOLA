from django.shortcuts import render
from django.http import Http404, HttpResponse
from django.shortcuts import redirect
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from bolipola.views import sale
from core.models import Calendar, Reservation
from core.forms import ReservationForm
import datetime

@login_required
def bolirana(request):
    form = ReservationForm()

    if request.method == 'POST':
        disponibility = request.POST.get('the_date', '')
        disponibility_to_date = datetime.datetime.strptime(disponibility, '%Y-%m-%d').date()
        place = request.POST.get('site', '')
        time_start = request.POST.get('hora-inicio', '')
        time_start_to_hour = datetime.datetime.strptime(time_start, "%H:%M")
        time_end = request.POST.get('hora-fin', '')
        time_end_to_hour = datetime.datetime.strptime(time_end, "%H:%M")
        cost = request.POST.get('cost', '')
        type = 'Bolirana'

        if cost == "":
            messages.error(request, '<i class="fa-solid fa-triangle-exclamation fa-bounce fa-xs"></i> Costo no válido')
            return redirect('bolirana_form')
        
        if (str(time_start_to_hour.minute) == "30" or str(time_start_to_hour.minute) == "0") and (str(time_end_to_hour.minute) == "30" or str(time_end_to_hour.minute) == "0"):
            pass
        else:
            messages.error(request, '<i class="fa-solid fa-triangle-exclamation fa-bounce fa-xs"></i> La hora puesta no es correcta')
            return redirect('bolirana_form')
                    
        calendars = Calendar.objects.all()
        reserves = Reservation.objects.all().filter(confirmed=True) # Falta terminar
        
        for calendar in calendars:
            if disponibility_to_date == calendar.date:
                messages.error(request, '<i class="fa-solid fa-triangle-exclamation fa-bounce fa-xs"></i> Fecha no disponible, elige otro día')
                return redirect('bolirana_form')    
        
        new_reservation = Reservation(place=place, type=type, date=disponibility_to_date, start_time=time_start, end_time=time_end, cost=cost)
        new_reservation.save()
        return redirect(f'/sale/{new_reservation.id}/{new_reservation.sale_type()}')

    return render(request, 'reserve_types/bolirana.html', {'form':form})

@login_required
def court(request):
    form = ReservationForm()

    if request.method == 'POST':
        disponibility = request.POST.get('the_date', '')
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

    return render(request, 'reserve_types/court.html', {'form':form})

@login_required
def tables(request):
    form = ReservationForm()

    if request.method == 'POST':
        disponibility = request.POST.get('the_date', '')
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
                return redirect('tables_form')

        new_reservation = Reservation(place=place, type=type, date=disponibility_to_date, start_time=time_start, end_time=time_end, cost=cost)
        new_reservation.save()
        return redirect(f'/sale/{new_reservation.id}/{new_reservation.sale_type()}')

    return render(request, 'reserve_types/tables.html', {'form':form})