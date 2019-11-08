# imagen base
# FROM node:10

# # Copia del contexto de build a un destino que yo le pida  .<todo lo que esta en el contexto de buid.
# COPY [".", "/usr/src/"]
# # Parate aqui que voy a correr comandos y necesito que estes ahī
# WORKDIR /usr/src
# # corre npm install
# RUN npm install
# # puerto 
# EXPOSE 3000
# # Comando por defecto que va a correr el contenedor
# CMD ["node", "index.js"]


# Construir imagen:docker build -t platziapp .
# Cuando termine de correr el contenedor que se borre : flag -rm
# en el puerto x de mi compu se llegue el puerto x del contenedor : flag -p 3000:3000
# Correr Imagen: docker run --rm -d -it -p 3000:3000 platziapp


# ENTENDIENDO EL CACHE DE LAYERS PARA ESTRUCTURAR CORRECTAMENTE
# No insumir demasiado tiempo en el build
FROM node:10


# Copio  solo los archivos que mutan  con el comando npm install
COPY ["package.json", "package-lock.json", "/usr/src/"]
# Parate aqui que voy a correr comandos y necesito que estes ahī
WORKDIR /usr/src
# corre npm install
RUN npm install
# Copia del contexto de build a un destino que yo le pida  .<todo lo que esta en el contexto de buid .
COPY [".", "/usr/src/"]
# puerto
EXPOSE 3000
# Comando por defecto que va a correr el contenedor
# CMD ["node", "index.js"]


# COMO ACTUALIZAR EL CONTENIDO DE UN CONTENEDER sin buildiar la imagen
# nodeMond: monitorea node y cuando detecta un cambio se reinicia
CMD ["npx", "nodemon", "index.js"]

#  Montamos los archivos
# docker run --rm -p 3000:3000 -v $(pwd):/usr/src platziapp
# /Borrar todos los contenedores
# docker rm -f  $(docker ps -aq)
