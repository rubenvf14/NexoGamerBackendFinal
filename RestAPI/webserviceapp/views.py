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

#En esta función, simplemente cogeremos todos los datos de la tabla juegos y los imprimiremos por pantalla
def devolver_juegos(request):
    if request.method == 'GET':
        juegos =Juegos.objects.all()
        array = []
        for juego in juegos:
            diccionario = {
                'id': juego.id,
                'nombre': juego.nombre,
                'genero': juego.genero,
                'fechaSalida': juego.fechasalida,
                'consola': juego.consola,
                'descripcion': juego.descripcion,
                'urlImagen': juego.urlimagen,
                'compañia': juego.compañia,
                'valoracion': juego.valoracion,
                'precio': juego.precio,
                'rebaja': juego.rebaja,
                'comentarioId': juego.comentarioid.id
            }
            array.append(diccionario)
        return JsonResponse(array, safe = False)
    else:
        return JsonResponse("Method not allowed")

def devolver_juegos_PorNombrePlataforma(request):
    if request.method == 'GET':
        # Obtenemos el nombre de la plataforma desde la URL
        plataforma_name = request.GET.get('nombre')

        # Si se proporciona el nombre de la plataforma
        if plataforma_name:
            # Convertimos la primera letra en minúscula y luego en mayúscula para garantizar consistencia
            plataforma_name = plataforma_name.lower().capitalize()

            try:
                # Obtenemos todos los juegos cuyas plataformas comiencen con el nombre proporcionado
                juegos = Juegos.objects.filter(plataformasjuegos__nombre__startswith=plataforma_name)

                # Creación del array para almacenar los datos de los juegos
                array = []

                # Guardamos los datos de los juegos en el array
                for juego in juegos:
                    diccionario = {
                        'id': juego.id,
                        'nombre': juego.nombre,
                        'genero': juego.genero,
                        'fechaSalida': juego.fechasalida,
                        'consola': juego.consola,
                        'descripcion': juego.descripcion,
                        'urlImagen': juego.urlimagen,
                        'compañia': juego.compañia,
                        'valoracion': juego.valoracion,
                        'precio': juego.precio,
                        'rebaja': juego.rebaja,
                        'comentarioId': juego.comentarioid.id
                    }
                    array.append(diccionario)

                # Devolvemos los datos de los juegos en formato JSON
                return JsonResponse(array, safe=False)
            
            except Juegos.DoesNotExist:
                # Si no se encuentran juegos para la plataforma, devolver un mensaje de error
                return JsonResponse({'error': 'No hay juegos asociados a la plataforma proporcionada'}, status=404)
            except Exception as e:
                # Manejar cualquier otra excepción que pueda ocurrir
                return JsonResponse({'error': str(e)}, status=500)
        else:
            # Si no se proporcionó el nombre de la plataforma en los parámetros de consulta, devolver un mensaje de error
            return JsonResponse({'error': 'Nombre de plataforma de juegos no proporcionado en la URL'}, status=400)

def devolver_juegos_PorGenero(request):
     if request.method == 'GET':
          #Introduciremos el género después de la palabra "genero" localizada en la URL del buscador y convertimos la primera letra a mayúscula
          genero_name = request.GET.get('genero').capitalize()
          
          #Si existe el nombre del genero
          if genero_name:
               try:
                    #Filtramos la tabla por el género que haya introducido el usuario
                    juegos = Juegos.objects.filter(genero__startswith = genero_name)

                    #Creación del array
                    array = []

                    #Guardamos los datos con un bucle
                    for juego in juegos:
                        diccionario = {
                            'id': juego.id,
                            'nombre': juego.nombre,
                            'genero': juego.genero,
                            'fechaSalida': juego.fechasalida,
                            'consola': juego.consola,
                            'descripcion': juego.descripcion,
                            'urlImagen': juego.urlimagen,
                            'compañia': juego.compañia,
                            'valoracion': juego.valoracion,
                            'precio': juego.precio,
                            'rebaja': juego.rebaja,
                            'comentarioId': juego.comentarioid.id
                        }
                        array.append(diccionario)
                    
                    #Devolvemos el resultado en formato de objeto
                    return JsonResponse(array, safe = False)

               except Juegos.DoesNotExist:
                # Si no se encuentra el juego, devolver un mensaje de error
                    return JsonResponse({'error': 'Juego no encontrado'}, status=404)
               except Exception as e:
                # Manejar cualquier otra excepción que pueda ocurrir
                return JsonResponse({'error': str(e)}, status=500)
     else:
            # Si no se proporcionó el nombre de la plataforma en los parámetros de consulta, devolver un mensaje de error
        return JsonResponse({'error': 'Género del juego no proporcionado en la URL'}, status=400)