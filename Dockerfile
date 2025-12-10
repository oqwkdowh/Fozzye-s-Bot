FROM node:18-alpine

# El gestor de paquetes de Alpine es APK. 
# Esto limpia la caché de APK y actualiza el índice de paquetes en un solo comando.
RUN apk update && apk add --no-cache bash

# Instala las herramientas clave (ffmpeg, imagemagick, etc.)
# Usamos el comando 'apk' para instalar las dependencias binarias
RUN apk add --no-cache ffmpeg imagemagick webp

COPY package.json .

RUN npm install && npm install qrcode-terminal

COPY . .

EXPOSE 5000

CMD ["node", "index.js"]