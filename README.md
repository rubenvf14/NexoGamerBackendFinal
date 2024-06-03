<html>


## <h1 align="center" font-family="Kanit">NEXOGAMER</h1>




<div align="center">

![nexoGamerFinal](https://github.com/rubenvf14/NexoGamerFrontendFinal/assets/145007165/7c22138f-b7a2-4146-8c9b-f5ddaac7dedf)

</div>

## <h2> 🔖 Índice</h2>

<ul>

<li>Título e imagen de portada</li>

<li>Insignias</li>

<li>Descripción del proyecto</li>

<li>Estado del proyecto</li>

<li>Características de la aplicación y demostración</li>

<li>Acceso al proyecto</li>

<li>Tecnologías utilizadas</li>

<li>Desarrolladores del proyecto</li>

<li>Licencia</li>

<li>Conclusión</li>
  
</ul>


:construction: Estado del proyecto :construction:


<p align="left">


<img src="https://img.shields.io/badge/Status-En_desarrollo-green">


</p>






Stars del proyecto:


![GitHub Org's stars](https://img.shields.io/github/stars/rubenvarela)






Esta aplicación web llamada "NexoGamer" consiste en una red venta de videojuegos online tanto a nivel nacional como internacional. Nuestro principal objetivo es atraer al público gamer, es decir, todas las personas que juegan a videojuegos con frecuencia y disfrutan haciéndolo. En nuestra página le ofreceremos descuentos exclusivos y una gran variedad de géneros, títulos, etc para poder seguir haciendo lo que más les gusta, jugar a videojuegos. ¡Esperamos veros pronto!


## 🛠️ Funcionalidades del proyecto 🛠️


- `Número de horas del proyecto`: 60 horas


- `Número de participantes del proyecto`: 1


- `Tema principal`: videojuegos y venta de videojuegos


- `Características principales`: venta de videojuegos en línea, página web gratuita, últimas tendencias, cuentas personales.


https://github.com/rubenvf14/NexoGamerFrontendFinal/assets/145007165/376845e6-536b-4e49-b6b8-eeee2d30a1ba

## 📁 Acceso al proyecto

<p>Para poder iniciar el proyecto "NexoGamer", es necesario descargar tanto el backend como el frontend. ¿Qué quiere decir esto? Pues que se debe descargar tanto el servidor como la página web para poder trabajar con ella correctamente. ¿Y en qué orden debo hacerlo? Pues en primer lugar el backend, para que pueda cargar todo el contenido correctamente el frontend posteriormente, y finalmente el frontend. Además, se deberá tener la clave pública activada tanto en GitHub como en GitLab para poder trabajar correctamente con los repositorios.</p>

<p>Los links son estos 🔗</p>

<ul>
  <li>Backend: https://github.com/rubenvf14/NexoGamerBackendFinal</li>
  <li>Frontend: https://gitlab.com/rubenvarelafigueroa/NexoGamerDefinitivo</li>
</ul>

<p>Una vez entres a cada link aparecerá una opción llamada "<> Code" en verde, entonces deberás clicar en ella y copiar al portapapeles el contenido</p>

## <h1> 💻 Backend</h1>

<p>En primer lugar, tendras que instalar una máquina virtual, en mi caso Oracle VM VirtualBox, que posea al menos 4 GB de RAM y 20 GB de espacio de almacenamiento en el sistema operativo Debian (64-bit). Además,
deberás cambiarle el renvío de puertos en la configuración de la máquina virtual. El directorio es el siguiente: Configuración/Red/Adaptador 1/Reenvío de puertos. Ahí le asignarás tanto al puerto anfitrión como invitado el puerto 8000.</p>

<p>Una vez tengas configurada la máquina virtual, la iniciarás y en el directorio que desees deberás clonar el backend de NexoGamer. Para conseguir hacerlo tienes que coger el link del "<> Code" tal y como lo hago yo en el vídeo de "backend" y luego ejecutar los siguientes comandos:</p>

## <h1>⌨️ Comandos ⌨️</h1>
<ul>
  <li>sudo apt update</li>
  <li>sudo apt upgrade</li>
  <li>sudo apt install git</li>
  <li>sudo apt install python3</li>
  <li>sudo apt install python3 python3-pip</li>
  <li>sudo apt install python3-virtualenv</li>
  <li>pip install django</li>
  <li>pip install django-cors-headers</li>
  <li>pip install PyJWT</li>
  <li>sudo apt install mariadb-server</li>
  <li>virtualenv django_pip</li>
</ul>

<p>Además, después deberemos entrar a MariaDb y hacer los siguientes pasos. Para comenzar teclearemos el siguiente comando: sudo mysql -u root -p y cubriremos los campos que nos pida el sistema. A continuación, introduciremos este otro SOURCE /home/ruben/NexoGamerBackendFinal/DB/nexogamerdb.sql -> solo aplica en mi caso particular, ya que se deberá modificar la ruta en función del nombre del usuario de la máquina virtual y la ruta donde esté alojado el backend. Luego, se deberá introducir este otro comando: sudo mysqldump -u root -p nexogamerdb > /home/ruben/NexoGamerBackendFinal/DB/dump/nexogamerdb.sql. Finalmente deberás ejecutar el siguiente comando: python3 manage.py inspectdb > webserviceapp/models.py y para arrancar el servidor python3 manage.py runserver 0.0.0.0:8000</p>

## <h1>❎ Errores :❎</h1>

<p>Si te da errores relacionados con MariaDB prueba estos comandos: pip install mysqlclient y sudo apt install python3-django. Además, dentro de MariaDB ejecuta estes otros y luego vuelve a probar a iniciar el servidor: </p>

<ul>
  <li>GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTFIED BY '1234' WITH GRANT OPTION;</li>
  <li>FLUSH PRIVILEGES;</li>
  <li>EXIT;</li>
</ul>

<div>
  






https://github.com/rubenvf14/NexoGamerFrontendFinal/assets/145007165/ea5e9bc7-108a-4b14-b498-4f24c1758595









</div>

<p>Finalmente, deberás seguir los pasos del vídeo de backend y tendrás activa la máquina virtual con el código necesario para ejecutar el servidor de NexoGamer</p>

<div>
  

https://github.com/rubenvf14/NexoGamerFrontendFinal/assets/145007165/fb4cdf64-6265-4cf6-83b4-5955dca214ab


</div>

<p>Una vez hayas seguidos esos pasos debería aparecer una carpeta llamada RestAPI, a mi no me aparece porque no está terminado aún el repositorio, pero cuando lo esté debes seguir los pasos finales de este vídeo</p>

<div>
  



https://github.com/rubenvf14/NexoGamerFrontendFinal/assets/145007165/0f5d17ef-2940-42ea-922c-304aed910d46




</div>

## <h1> 💻 Frontend</h1>

<p>A continuación, deberás clonar el repositorio con el comando git clone en una terminal de Windows o en el sistema operativo que poseas. ¿Y cómo se hace todo eso? En mi caso sería git clone git@github.com:rubenvf14/NexoGamerFrontendFinal.git, debido a que tengo mi propia cuenta de github. Cabe destacar que solo funcionará este paso en la versión final de NexoGamer.</p>

<div>
  



https://github.com/rubenvf14/NexoGamerFrontendFinal/assets/145007165/89b89c4b-9158-43c5-be76-0d2459a29797




</div>

<p>Finalmente te dirigirás al directorio "src", situado dentro de la carpeta "frontend", y ejecutarás los comandos npm install y acto seguido npm start. En mi caso lo he realizado desde visual studio code, pero se puede hacer también desde la terminal de Windows como en el vídeo de arriba.</p>

<div>
  

https://github.com/rubenvf14/NexoGamerFrontendFinal/assets/145007165/8f13af8f-ec97-4369-aaa4-a2d2046c170a


</div>

<p>¡Y listo! Ya tendrías la aplicación web de NexoGamer funcionando correctamente.</p>

## <h1> ✔️ Tecnologías utilizadas</h1>
<ul>
  <li>React</li>
  <li>Django</li>
  <li>JavaScript</li>
  <li>Python</li>
  <li>Node js</li>
  <li>HTML</li>
  <li>CSS</li>
</ul>

## <h1> 📖 Autores</h1>
<p>Rubén Varela Figueroa, creador y desarrollador de NexoGamer -> perfil de GitHub: https://github.com/rubenvf14</p>

## <h1> 🤔 Conclusión</h1>
<p>En resumen, ¿por qué deberías visitar NexoGamer? Porque en nuestra página ofreceremos descuentos increíbles para juegos que nunca te podrías imaginar, y si eres un jugador al que le encantan los videojuegos siempre nos tendrás en cuenta para tus próximos títulos.
</p>
