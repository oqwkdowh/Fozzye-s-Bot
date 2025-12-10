FROM node:lts-buster

# Limpia la caché y configura una conexión más confiable
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Intenta la actualización de la lista de paquetes
RUN apt-get update

# Paso 2: Instala las herramientas clave
RUN apt-get install -y ffmpeg imagemagick webp

COPY package.json .

RUN npm install && npm install qrcode-terminal

COPY . .

EXPOSE 5000

CMD ["node", "index.js"]
