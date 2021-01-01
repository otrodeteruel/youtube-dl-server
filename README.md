
fork sobre el proyecto https://github.com/manbearwiz/youtube-dl-server

  
# youtube-dl-server

youtube-dl es una aplicación estupenda para descargar videos de internet o descargar y convertir a audio, yo la llevo usando desde hace mucho tiempo, lo único es que es una aplicación de terminal, no tiene entorno gráfico, con la idea de poner servicio en marcha en mi raspberry pi para usarlos en mi red local, me puse a buscar un youtube-dl con interface web con docker y me encontré en internet este proyecto.


![screenshot](https://github.com/otrodeteruel/youtube-dl-server/raw/master/youtube-dl-server.png)


Lo he tenido varios dias en mi raspberry y funciona perfectamente, pero como no puedo quedarme quieto, he decidido hacerle algunos cambios para adaptado perfectamente a mis necesidades, los cambios son los siguiente:

 - he simplificado los formatos a solo a audio y videos.
 - he creado una llamada por ajax.
 - he puesto para que se guarden por separado los audios y los videos en sus carpetas correspondientes.
 - he añadido la opción de carpeta sobre todo para la descarga de listas que se introducen todas en la carpeta, es decir, si se rellena carpeta por ejemplo "curso de python" y se pega la url del video o la lista y todos los videos se introducirán en /video/curso de python.
 - he creado una imagen para arquitectura arm de raspberry

## para correr el contenedor

con docker:

    docker run --rm --name youtube-dl -p 8080:8080 -v $PWD/youtube-dl:/youtube-dl otrodeteruel/youtube-dl-server

accedemos al navegador 

http://localhost:8080/youtube-dl

con docker compose:


## Como lo he hecho?

### entorno de desarrollo

para hacer cambios del programa he usado como entorno el mismo contenedor, para ello lo corremos

    docker run -it -rm --name youtube-dl -p 8080:8080 -v $PWD/.:/usr/src/app kmb32123/youtube-dl-server sh

y estamos dentro del contenedor. Para ejecutar el servidor y probar ejecutamos:

    python youtube-dl-server.py

accedemos al navegador 

    http://localhost:8080/youtube-dl

### crear nuevo docker

para la creación de las imágenes de docker para las diferente arquitectura he decidido usar github action para que regenere automáticamente las imagen cada vez que se haga un cambio.