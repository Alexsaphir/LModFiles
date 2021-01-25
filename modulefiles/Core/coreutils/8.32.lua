local apps = "/opt/apps"
local name = myModuleName()
local version = myModuleVersion()

local pkg = pathJoin(apps, name, version)

local bin = pathJoin(pkg, "bin")
local man = pathJoin(pkg, "share/man")
local info = pathJoin(pkg, "share/info")

family('coreutils')

help("This module loads coreutils " .. version .. " into the environment.")

whatis("Name        : " .. name)
whatis("Version     : " .. version)
whatis("Keywords    : Compiler, Tools")
whatis("URL         : https://www.gnu.org/software/coreutils/")
whatis("Patch version of cp and mv : -g flag allow a progressbar")
whatis("Description : Loads coreutils")

prepend_path("PATH",  bin)
prepend_path("MANPATH", man)
prepend_path("INFOPATH", info)

set_alias("cpg","cp -g")
set_alias("mvg","mv -g")