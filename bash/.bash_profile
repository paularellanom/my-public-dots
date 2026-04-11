# Obtener alias y funciones si existen
[ -f $HOME/.bashrc ] && . $HOME/.bashrc

# 1. Definir variables de entorno para Wayland/Sway
export XDG_RUNTIME_DIR=/run/user/$(id -u)
export XDG_SESSION_TYPE=wayland
export XDG_CURRENT_DESKTOP=sway
export XDG_SESSION_DESKTOP=sway
export LIBVA_DRIVER_NAME=i965
export mesa_glthread=true

# Mejor manejo de rutas para Flatpak y sistema
export XDG_DATA_DIRS="${XDG_DATA_DIRS:-/usr/local/share:/usr/share}:$HOME/.local/share/flatpak/exports/share:/var/lib/flatpak/exports/share"

# Fix para errores de bus de accesibilidad (el retraso de wofi)
export NO_AT_BRIDGE=1

export EDITOR="nvim"

# 2. Fix para gráficos Intel antiguos (Sandy Bridge - HP ProBook 6360b)
export WLR_DRM_NO_ATOMIC=1

# 3. Asegurar que el directorio de ejecución exista
if [ ! -d "$XDG_RUNTIME_DIR" ]; then
  mkdir -p "$XDG_RUNTIME_DIR"
  chmod 700 "$XDG_RUNTIME_DIR"
fi

# 4. Iniciar la sesión
# Eliminamos dbus-launch y usamos solo dbus-run-session
if [ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
  exec dbus-run-session sway
fi
