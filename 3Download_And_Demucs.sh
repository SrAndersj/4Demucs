#!/bin/bash

# Actualiza pip e instala yt-dlp
python -m pip install --upgrade pip
python -m pip install yt-dlp

# Descarga la canción de YouTube
yt-dlp -x --audio-format mp3 -o "%(title)s.%(ext)s" "https://www.youtube.com/watch?v=zcq7khV_jDQ"

# Instala demucs
python -m pip install demucs

# Encuentra el archivo MP3 descargado (asumiendo que solo hay uno)
filename=$(ls | grep -i ".mp3$" | head -n 1)

# Verifica si se encontró el archivo y no está vacío
if [[ ! -z "$filename" ]]; then
  # Ejecuta demucs en el archivo descargado
  python -m demucs.separate "$filename"
else
  echo "No se encontró el archivo MP3 descargado."
fi
