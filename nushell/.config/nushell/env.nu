# env.nu
#
# Installed by:
# version = "0.111.0"
#
# Previously, environment variables were typically configured in `env.nu`.
# In general, most configuration can and should be performed in `config.nu`
# or one of the autoload directories.
#
# This file is generated for backwards compatibility for now.
# It is loaded before config.nu and login.nu
#
# See https://www.nushell.sh/book/configuration.html
#
# Also see `help config env` for more options.
#
# You can remove these comments if you want or leave
# them for future reference.

# Aceleración de video para Intel HD 3000
$env.LIBVA_DRIVER_NAME = "i965"
$env.VDPAU_DRIVER = "va_gl"

$env.EDITOR = "nvim"
$env.VISUAL = "nvim"
