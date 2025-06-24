#!/bin/bash
set -e  # Detiene el script si hay un error

echo "=== Instalando Android SDK ==="
sudo apt update && sudo apt install -y wget unzip

# Descarga Command Line Tools de Android
wget https://dl.google.com/android/repository/commandlinetools-linux-9477386_latest.zip
unzip commandlinetools-linux-*.zip -d android-sdk
rm commandlinetools-linux-*.zip

# Configura variables de entorno
export ANDROID_SDK_ROOT="$PWD/android-sdk"
export PATH="$PATH:$ANDROID_SDK_ROOT/cmdline-tools/bin"

# Acepta licencias e instala plataformas necesarias
yes | sdkmanager --licenses
sdkmanager "platform-tools" "platforms;android-33" "build-tools;33.0.0"

echo "=== Android SDK instalado en $ANDROID_SDK_ROOT ==="
