# config.nu
#
# Installed by:
# version = "0.111.0"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# Nushell sets "sensible defaults" for most configuration settings, 
# so your `config.nu` only needs to override these defaults if desired.
#
# You can open this file in your default editor using:
#     config nu
#
# You can also pretty-print and page through the documentation for configuration
# options using:
#     config nu --doc | nu-highlight | less -R

source ~/.cache/starship/init.nu

def --env y [...args] {
	let tmp = (mktemp -t "yazi-cwd.XXXXXX")
	yazi ...$args --cwd-file $tmp
	let cwd = (open $tmp)
	if $cwd != "" and $cwd != $env.PWD {
		cd $cwd
	}
	rm -f $tmp
}

# Función para actualizar listas de software
def "update-pkgs" [] {
    cd ~/dotfiles
    # Lista de XBPS (Void)
    xbps-query -m | save -f packages.txt
    # Lista de Flatpak
    flatpak list --app --columns=application | save -f flatpaks.txt
    print "✅ Listas de software actualizadas en ~/dotfiles"
}
