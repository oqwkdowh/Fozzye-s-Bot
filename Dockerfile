
FROM node:18-alpine

# Instala paquetes fundamentales para que funcione 'bash' y las herramientas de compilación
RUN apk update && apk add --no-cache bash build-base

# Instala las herramientas clave para el bot (ffmpeg, imagemaick, etc.)
RUN apk add --no-cache ffmpeg imagemagick webp

# ... El resto del archivo se mantiene igual ...

# Instala las herramientas clave (ffmpeg, imagemagick, etc.)
# Usamos el comando 'apk' para instalar las dependencias binarias
RUN apk add --no-cache ffmpeg imagemagick webp

COPY package.json .

RUN npm install && npm install qrcode-terminal

COPY . .

EXPOSE 5000

CMD ["node", "index.js"]