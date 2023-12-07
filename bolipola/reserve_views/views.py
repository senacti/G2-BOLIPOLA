from django.shortcuts import render
from django.http import Http404, HttpResponse
from django.shortcuts import redirect
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from bolipola.views import sale
from core.models import Calendar, Reservation
from core.forms import ReservationForm
import datetime

def calc_cost(hora_inicio_user, hora_final_user):
    formato_hora = "%H:%M"
    hora_inicio = datetime.datetime.strptime(hora_inicio_user, formato_hora)
    hora_final = datetime.datetime.strptime(hora_final_user, formato_hora)

    diferencia_minutos = round((hora_final - hora_inicio).total_seconds() / 60)
    precio_por_minuto = 600
    costo = diferencia_minutos * precio_por_minuto

    if costo <= 0:
        return False

    return costo

# Función para validar todo lo que tenga que ver con reservar
def validate_camps(date_strp, time_start_str, time_end_str, time_start_strp, time_end_strp, cost, type):
    reason = 'nada'
    i_minutes = 30

    if time_start_strp >= time_end_strp:
        reason = '<i class="fa-solid fa-triangle-exclamation fa-bounce fa-xs"></i> Horas no válidas'
        return [False, reason]

    if cost == "":
        reason = '<i class="fa-solid fa-triangle-exclamation fa-bounce fa-xs"></i> Costo no válido'
        return [False, reason]
    
    cost_valid = calc_cost(time_start_str, time_end_str)
    if not cost_valid:
        reason = '<i class="fa-solid fa-triangle-exclamation fa-bounce fa-xs"></i> Costo no válido'
        return [False, reason]

    if cost_valid != int(cost):
        reason = '<i class="fa-solid fa-triangle-exclamation fa-bounce fa-xs"></i> Costo no válido'
        return [False, reason]
    

    if (str(time_start_strp.minute) == "30" or str(time_start_strp.minute) == "0") and (str(time_end_strp.minute) == "30" or str(time_end_strp.minute) == "0"):
        pass
    else:
        reason = '<i class="fa-solid fa-triangle-exclamation fa-bounce fa-xs"></i> La hora puesta no es correcta'
        return [False, reason]
    
    # Verificando que el día esté disponible por los admins
    calendars = Calendar.objects.all()
    for calendar in calendars:
        if date_strp == calendar.date:
            reason = '<i class="fa-solid fa-triangle-exclamation fa-bounce fa-xs"></i> Fecha no disponible, elige otro día'
            return [False, reason]

    # Verificando que la fecha y hora no estén ya reservadas en ese tipo de reserva
    reserves = Reservation.objects.all().filter(confirmed=True)
    for reserve in reserves:
        # Convertir tiempo en solo horas y minutos para comparar
        r_start_strp = reserve.start_time.strftime("%H:%M")
        r_start_strp = datetime.datetime.strptime(r_start_strp, "%H:%M")
        r_end_strp = reserve.end_time.strftime("%H:%M")
        r_end_strp = datetime.datetime.strptime(r_end_strp, "%H:%M")

        # Comparar db de fechas ya reservadas con ingresadas
        if reserve.date == date_strp and reserve.type == type:
            while time_start_strp <= time_end_strp:
                if (time_start_strp >= r_start_strp and time_start_strp < r_end_strp):
                    reason = '<i class="fa-solid fa-triangle-exclamation fa-bounce fa-xs"></i> La fecha y hora ya están reservados,<br>elige otra fecha'
                    return [False, reason]
                time_start_strp += datetime.timedelta(minutes=i_minutes)

    return [True, reason]

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
        
        # Función para las validaciones
        can_be_reserved = validate_camps(
            disponibility_to_date,
            time_start,
            time_end,
            time_start_to_hour,
            time_end_to_hour,
            cost,
            type
        )

        if not can_be_reserved[0]:
            messages.error(request, can_be_reserved[1])
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
        time_start_to_hour = datetime.datetime.strptime(time_start, "%H:%M")
        time_end = request.POST.get('hora-fin', '')
        time_end_to_hour = datetime.datetime.strptime(time_end, "%H:%M")
        cost = request.POST.get('cost', '')
        type = 'Cancha'

        # Función para las validaciones
        can_be_reserved = validate_camps(
            disponibility_to_date,
            time_start,
            time_end,
            time_start_to_hour,
            time_end_to_hour,
            cost,
            type
        )

        if not can_be_reserved[0]:
            messages.error(request, can_be_reserved[1])
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
        time_start_to_hour = datetime.datetime.strptime(time_start, "%H:%M")
        time_end = request.POST.get('hora-fin', '')
        time_end_to_hour = datetime.datetime.strptime(time_end, "%H:%M")
        cost = request.POST.get('cost', '')
        type = 'Mesa'

        # Función para las validaciones
        can_be_reserved = validate_camps(
            disponibility_to_date,
            time_start,
            time_end,
            time_start_to_hour,
            time_end_to_hour,
            cost,
            type
        )

        if not can_be_reserved[0]:
            messages.error(request, can_be_reserved[1])
            return redirect('tables_form')

        new_reservation = Reservation(place=place, type=type, date=disponibility_to_date, start_time=time_start, end_time=time_end, cost=cost)
        new_reservation.save()
        return redirect(f'/sale/{new_reservation.id}/{new_reservation.sale_type()}')

    return render(request, 'reserve_types/tables.html', {'form':form})