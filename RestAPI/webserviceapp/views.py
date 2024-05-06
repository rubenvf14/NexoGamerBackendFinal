import datetime
from django.db.models import Q
from django.shortcuts import render
from django.http import HttpResponse, JsonResponse
from django.views import View
from .models import Users
from .models import Juegos
from .models import Comentariosjuegos
from .models import Favoritos
from .models import Plataformasjuegos
import json, jwt
from django.views.decorators.csrf import csrf_exempt
from django.contrib.auth.hashers import make_password
from django.contrib.auth.hashers import check_password
import datetime
from django.core.paginator import Paginator
from django.views.decorators.http import require_POST

# Create your views here.

#En esta función, simplemente cogeremos todos los datos de la tabla usuarios y los imprimiremos por pantalla
def devolver_usuarios(request):
    if request.method == 'GET':
        usuarios = Users.objects.all()
        array = []
        for usuario in usuarios:
            diccionario = {
                'id': usuario.id,
                'nombre': usuario.nombre,
                'apellidos': usuario.apellidos,
                'contraseña': usuario.contraseña,
                'telefono': usuario.telefono,
                'email': usuario.email,
                'juegoFavoritoId': usuario.juegofavoritoid.id,
                'comentarioJuegoId': usuario.comentariojuegoid.id,
                'sessionToken': usuario.sessiontoken
            }
            array.append(diccionario)
        return JsonResponse(array, safe = False)
    else:
        return JsonResponse("Method not allowed")