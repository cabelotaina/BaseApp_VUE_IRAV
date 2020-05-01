FROM node:11.13.0-alpine

# creamos directorio de destino
RUN mkdir -p /usr/src/BaseApp_VUE_IRAV
WORKDIR /usr/src/BaseApp_VUE_IRAV

# actualizamos e instalamos dependencias

RUN apk update && apk upgrade 
RUN apk add git

# copiamos la app, note .dockerignore

COPY . /usr/src/BaseApp_VUE_IRAV/
RUN apk add python make g++
RUN npm install

# Ejecutamos en modo BUILD

RUN npm run build

# exponer puerto de Container
EXPOSE 5000

# set app serving to permissive / assigned
ENV NUXT_HOST=0.0.0.0
# set app port
ENV NUXT_PORT=5000

# start the app
CMD [ "npm", "start" ]