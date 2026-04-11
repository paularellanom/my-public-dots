#!/bin/bash
# Script de Toggle Robusto para HP ProBook 6360b
DEV_ID="1-1.4"
AUTH_FILE="/sys/bus/usb/devices/$DEV_ID/authorized"

# Si el dispositivo de video EXISTE, es que está ON. Entonces lo apagamos.
if [ -e /dev/video0 ]; then
    echo "Detectada cámara activa. Desactivando..."
    echo 0 | sudo /usr/bin/tee "$AUTH_FILE"
else
    # Si no existe, es que está OFF. Lo encendemos.
    echo "Cámara no detectada. Activando..."
    echo 1 | sudo /usr/bin/tee "$AUTH_FILE"
fi
