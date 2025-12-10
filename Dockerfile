FROM node:lts-buster

# Paso 1: Asegura que el índice de paquetes esté actualizado
RUN apt-get update

# Paso 2: Instala las herramientas clave
RUN apt-get install -y ffmpeg imagemagick webp

COPY package.json .

RUN npm install && npm install qrcode-terminal

COPY . .

EXPOSE 5000

CMD ["node", "index.js"]
