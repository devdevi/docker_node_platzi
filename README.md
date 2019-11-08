# Curso de Docker en Platzi

Ésta es una aplicación de ejemplo para el curso de Docker de Platzi por Guido
Vilariño.

Encuentra más información en https://platzi.com, suscríbete al curso y aprende
a usar Docker de manera profesional.


### NETWORKING DOCKER: Colaboración entre contenedores
``` 
docker network ls
```
    crear una red agregamos el --flag attachable: Permite que contenedores en el futuro se conecten a esta red.
```
docker network create --attachable <name>
```
Creamos los contenedores de base de datos
```
docker run -d --name db mongo
```
conectamos el contenedor a la red
```
docker network connect <redname> db
```
Miramos que contenedores tenemos en nuestra red
```
docker network inspect <redname>
```
Corremos contenedor de la aplicación
```
docker run  -d --name app - p 3000:3000 --env MONGO_URL=mongodb://db:27017/test <imagename>
```
--flag: --env : variable de entorno que recibe el index.js
si dos contenedores se están en el mismo networking pueden verse entre si utilizando como hostname el nombre del contenedor como
"la dirección de la computadora"
