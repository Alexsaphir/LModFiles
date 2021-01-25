local apps = "/opt/apps"
local name = myModuleName()
local version = myModuleVersion()

local pkg = pathJoin(apps, name, version)

local bin = pathJoin(pkg, "bin")
local include = pathJoin(pkg, "include")
local man = pathJoin(pkg, "share/man")
local info = pathJoin(pkg, "share/info")

family('make')

help("This module load Make " .. version .. " into the environment.")

whatis("Name        : " .. name)
whatis("Version     : " .. version)
whatis("Keywords    : Compiler, Tools, GNU")
whatis("URL         : https://www.gnu.org/software/make/")
whatis("Description : Loads Make")

prepend_path("PATH", bin)
prepend_path("CPATH", include)
prepend_path("MANPATH", man)
prepend_path("INFOPATH", info)