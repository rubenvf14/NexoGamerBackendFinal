import datetime
from django.core import serializers
from django.db.models import Q
from django.shortcuts import render
from django.http import HttpResponse, JsonResponse
from django.views import View
from .models import Users
from .models import Juegos
from .models import Comentariosjuegos
from .models import Favoritos
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
                juegos = Juegos.objects.filter(plataformasjuegos__nombre__icontains=plataforma_name)

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
                    juegos = Juegos.objects.filter(genero__icontains = genero_name)

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

def devolver_juegos_PorNombre(request):
    if request.method == 'GET':
        #Introduciremos el género después de la palabra "genero" localizada en la URL del buscador y convertimos la primera letra a mayúscula
        juego_name = request.GET.get('nombre').capitalize()
    
    #Si existe el nombre del juego
        if juego_name:
            try:
                #Filtramos la tabla por el nombre del juego que haya introducido el usuario o buscamos el alias del juego
                juegos = Juegos.objects.filter(Q(nombre__icontains = juego_name) | Q(alias__icontains=juego_name.lower()))

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
                        'comentarioId': juego.comentarioid.id,
                        'plataforma': juego.plataforma
                    }

                    # Verificar si el juego tiene un alias
                    if juego.alias:
                        # Si tiene alias, agregamos el campo 'alias' al diccionario
                        diccionario['alias'] = juego.alias
                    array.append(diccionario)
                
                return JsonResponse(array, safe = False)

            except Juegos.DoesNotExist:
                # Si no se encuentra el juego, devolver un mensaje de error
                return JsonResponse({'error': 'Juego no encontrado'}, status=404)
            except Exception as e:
                # Manejar cualquier otra excepción que pueda ocurrir
                return JsonResponse({'error': str(e)}, status=500)
        else:
            # Si no se proporcionó el nombre de la plataforma en los parámetros de consulta, devolver un mensaje de error
            return JsonResponse({'error': 'Nombre del juego no proporcionado en la URL'}, status=400)

def devolver_juegos_PorAño(request):
    if request.method == 'GET':
        #Introduciremos el año después de la palabra "año" localizada en la URL del buscador y convertimos la primera letra a mayúscula
        juego_year = int(request.GET.get('año'))      

        #Validamos que el año esté entre el 2000 y el 2024
        if juego_year >= 2000 and juego_year <= 2024:

        #Si existe el nombre del juego
            if juego_year:
                try:
                    #Cogemos todos los datos de la tabla juegos
                    juegos = Juegos.objects.all()

                    #Creación del array
                    array = []

                    #Guardamos los datos con un bucle
                    for juego in juegos:
                        if juego.fechasalida >= juego_year:
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

                except Exception as e:
                     #Manejar cualquier otra excepción que pueda ocurrir
                   return JsonResponse({'error': str(e)}, status=500)
            else:
                # Si no se proporcionó el nombre de la plataforma en los parámetros de consulta, devolver un mensaje de error
                return JsonResponse({'error': 'Fecha del juego no proporcionada en la URL'}, status=400)
        else:
            return JsonResponse({'error': 'The year must be between 2000 and 2024'}, status=400)

def devolver_juegos_favoritos(request, usuario_id):
    if request.method == 'GET':
        if usuario_id is None: 
            return JsonResponse({'error': 'no id selected'}, status=405)
        
        # Filtra los favoritos del usuario actual
        favoritos = Favoritos.objects.filter(userid=usuario_id, esfavorito = True)
        
        # Lista para almacenar los resultados
        lista_favorito = []
        
        # Itera sobre los favoritos y obtén las películas asociadas
        for favorito in favoritos:
            juego = favorito.juegoid
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
            lista_favorito.append(diccionario)
        
        # Devuelve la respuesta en formato JSON
        return JsonResponse(lista_favorito, safe=False)

    # Si el método no es GET, devuelve un error de método no permitido
    return JsonResponse({'error': 'Method not allowed'}, status=405)

@csrf_exempt
def register(request):
    if request.method == 'POST':
        try:
            data = json.loads(request.body.decode('utf-8'))

            # Verificar si los campos requeridos están presentes en los datos recibidos
            required_fields = ['nombre', 'apellidos', 'contraseña', 'telefono', 'email']
            for field in required_fields:
                if field not in data:
                    return JsonResponse({'error': 'Faltan parámetros en la solicitud'}, status=400)

            # Verificar si ya existe un usuario con el mismo nombre o email
            if Users.objects.filter(nombre=data['nombre']).exists() or Users.objects.filter(email=data['email']).exists():
                return JsonResponse({'error': 'Ya existe un usuario con ese nombre o email'}, status=409)

            # Crear el nuevo usuario
            new_user = Users(
                nombre=data['nombre'],
                apellidos=data['apellidos'],
                contraseña=make_password(data['contraseña']),  # Cifrar la contraseña antes de guardarla
                telefono=data['telefono'],
                email=data['email'],
            )
            new_user.save()
            return JsonResponse({'message': 'Usuario registrado exitosamente'}, status=201)
        except Exception as e:
            return JsonResponse({'error': str(e)}, status=400)

@csrf_exempt
def del_user(request, usuario_id):
    if request.method == 'DELETE':
        try:
            # Verificar si el usuario existe
            usuario = Users.objects.get(id=usuario_id)
            
            # Eliminar el usuario
            usuario.delete()
            
            return JsonResponse({'message': 'Usuario eliminado exitosamente'}, status=200)
        except Users.DoesNotExist:
            return JsonResponse({'error': 'El usuario no existe'}, status=404)
        except Exception as e:
            return JsonResponse({'error': str(e)}, status=400)
    else:
        return JsonResponse({'error': 'Método no permitido'}, status=405)

@csrf_exempt
def update_user(request, usuario_id):
    if request.method == 'PUT':
        try:
            # Obtener el usuario
            usuario = Users.objects.get(id=usuario_id)
            
            # Decodificar y obtener los datos de la solicitud
            data = json.loads(request.body.decode('utf-8'))

            # Actualizar los campos del usuario si existen en los datos
            if 'nombre' in data:
                usuario.nombre = data['nombre']
            if 'apellidos' in data:
                usuario.apellidos = data['apellidos']
            if 'contraseña' in data:
                # Hashear la contraseña antes de guardarla
                usuario.contraseña = make_password(data['contraseña'])
            if 'telefono' in data:
                usuario.telefono = data['telefono']
            if 'email' in data:
                usuario.email = data['email']

            # Guardar los cambios
            usuario.save()

            return JsonResponse({'message': 'Usuario actualizado exitosamente'}, status=200)
        except Users.DoesNotExist:
            return JsonResponse({'error': 'El usuario no existe'}, status=404)
        except Exception as e:
            return JsonResponse({'error': str(e)}, status=400)
    else:
        return JsonResponse({'error': 'Método no permitido'}, status=405)

SECRET_KEY = 'claveTremendamentesegura.'

def crear_token(usuario_id):
	payload = {
		'id': usuario_id,
		'exp': datetime.datetime.utcnow() + datetime.timedelta(days=1),
		'iat': datetime.datetime.utcnow()
	}
	token = jwt.encode(payload, SECRET_KEY, algorithm='HS256')
	return token

"""
    Verifica un token JWT incluido en la solicitud HTTP.

    Returns:
      		Una tupla con dos elementos:
            - JsonResponse o None: Si hay un error, devuelve una respuesta JSON con un mensaje de error.
            - dict or None: Si el token es válido, devuelve el payload decodificado.
"""

def verify_token(request):
	token = request.META.get('HTTP_AUTHORIZATION',None)
	if not token:
		return JsonResponse({'message':'Token is missing!'}, status=401), None

	try:
		if token.startswith('Bearer '):
			token = token.split(' ')[1]
		payload = jwt.decode(token, SECRET_KEY, algorithms=['HS256'])
		return None, payload
	except jwt.ExpiredSignatureError:
		return JsonResponse({'message':'Token has expired'}, status=401), None
	except jwt.InvalidTokenError:
		return JsonResponse({'message':'Invalid token!'}, status=401), None

# login
# cuando inicias sesion la primera vez lo hace perfectamente y cuando cierras tambien lo hace correctamente pero cuando inicias sesion por segunda vez te sale el error de contraseña incorrecta aún poniendo la contraseña bien

@csrf_exempt
def login(request):
    if request.method == 'POST':
        try:
            data = json.loads(request.body.decode('utf-8'))
            user = Users.objects.get(nombre=data['nombre'])
            if check_password(data['contraseña'], user.contraseña):
                token = crear_token(user.id)
                sessiontoken=crear_token(user.id)
                user.sessiontoken=sessiontoken
                user.save()
                return JsonResponse({'iduser': user.id, 'token': token}, status=200)
            else:
                return JsonResponse({'error': 'Contraseña incorrecta'}, status=401)
        except Users.DoesNotExist:
            return JsonResponse({'error': 'Usuario no encontrado'}, status=404)
    else:
        return JsonResponse({'error': 'Método no permitido'}, status=405)

@csrf_exempt
def logout(request, usuario_id):
    # Comprobación de token. El error_response guarda la información que le proporciona el return del verify_token
	error_response, payload = verify_token(request)
	#Si existe el error se visualizará por pantalla
	if error_response:
		return error_response

	#Si el método introducido no es un PATCH, saltará el error
	if request.method != 'PATCH':
		return JsonResponse({'error': 'Método no permitido'}, status=405)

	try:
		#Cogemos todos los objetos del modelo Users que coincidan con el filtrado introducido
		user = Users.objects.get(pk=usuario_id)
		user.sessiontoken = None  # o user.session_token =
		#Guardamos el objeto sessiontoken con el valor Nulo y luego guardamos los cambios con user.save()
		user.save()
		return JsonResponse({'message': 'Sesión cerrada exitosamente'}, status=200)
	except Users.DoesNotExist:
		return JsonResponse({'error': 'Faltan parametros o son incorrectos'}, status=400)
	except Exception as e:
		return JsonResponse({'error':'Unauthorized'},status=401)

#Put Favoritos
@csrf_exempt
def put_favoritos(request, favorito_id):
    if request.method == 'PUT':
        session_token = request.headers.get('SesionToken')
        usuario = Users.objects.filter(sessiontoken=session_token).first()
        if not usuario:
            # Si el usuario no está autenticado, devolver un error de autorización
            return JsonResponse({'error': 'Unauthorized'}, status=401)
        try:
            favoritos = Favoritos.objects.get(pk=favorito_id)
            data = json.loads(request.body)
            favoritos.esfavorito = data.get('Favorita?', favoritos.esfavorito)
            favoritos.save()
            if favoritos.esfavorito == 1:
                return JsonResponse({'message': 'Puesta como favorita'}, status=200)
            else:
                return JsonResponse({'message': 'Retirada de favoritos'}, status=200)
        except Favoritos.DoesNotExist:
            return JsonResponse({'error': 'Fav no encontrada'}, status=404)
        except Exception as e:
            return JsonResponse({'error': str(e)}, status=400)
    else:
        return JsonResponse({'error': 'Method Not Allowed'}, status=405)

def obtener_comentarios_juegos(request):
    # Obtener todos los juegos con sus comentarios asociados
    juegos_con_comentarios = Juegos.objects.select_related('comentarioid').all()

    # Crear una lista para almacenar los comentarios de cada juego
    comentarios_por_juego = []

    # Iterar sobre cada juego y obtener sus comentarios asociados
    for juego in juegos_con_comentarios:
        for comentario in juego.comentariosjuegos_set.all():
            comentarios_por_juego.append({
                'juegoNombre': juego.nombre,
                'comentario': comentario.comentario
            })

    # Devolver la lista de comentarios como respuesta JSON
    return JsonResponse(comentarios_por_juego, safe=False)

@csrf_exempt
def agregarComentario(request):
    if request.method == 'POST':
        try:
            data = json.loads(request.body.decode('utf-8'))
            comentario = data['comentario']
            juego_id = data['juegoId']
            user_id = data['userId']
            
            # Crear un nuevo comentario en la base de datos
            nuevo_comentario = Comentariosjuegos(
                comentario=comentario,
                juegoid_id=juego_id,
                userid_id=user_id
            )
            nuevo_comentario.save()
            
            return JsonResponse({'message': 'Comentario agregado exitosamente'}, status=200)
        except Exception as e:
            return JsonResponse({'error': str(e)}, status=500)
    else:
        return JsonResponse({'error': 'Método no permitido'}, status=405)