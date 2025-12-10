# Usa una imagen base de Node.js moderna sobre Debian Bullseye (estable y compatible)
FROM node:18-bullseye-slim

# 1. ACTUALIZAR E INSTALAR DEPENDENCIAS DE SISTEMA (Linux)
# Instalamos ffmpeg, imagemagick y las librerías necesarias con apt-get
RUN apt-get update && \
    apt-get install -y \
    ffmpeg \
    imagemagick \
    webp \
    libwebp-dev \
    git \
    python3 \
    build-essential \
    && apt-get clean

# 2. COPIAR E INSTALAR DEPENDENCIAS DE NODE.JS
# Crea el directorio de trabajo
WORKDIR /app

# Copia los archivos de configuración
COPY package.json .

# Instala las dependencias de Node.js (librerías del bot)
RUN npm install

# 3. COPIAR EL CÓDIGO RESTANTE
COPY . .

# 4. PUERTO Y COMANDO DE INICIO
# El bot escucha por el puerto 5000 (o 8080 en algunos casos, pero 5000 es común)
EXPOSE 5000

# Comando para ejecutar el bot
CMD ["node", "index.js"]