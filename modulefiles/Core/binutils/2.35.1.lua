local apps = "/opt/apps"
local name = myModuleName()
local version = myModuleVersion()

local pkg = pathJoin(apps, name, version)

local bin = pathJoin(pkg, "bin")
local lib = pathJoin(pkg, "lib")
local include = pathJoin(pkg, "include")
local man = pathJoin(pkg, "share/man")
local info = pathJoin(pkg, "share/info")

family('binutils')

help("This module loads binutils " .. version .. " into the environment.")

whatis("Name        : " .. name)
whatis("Version     : " .. version)
whatis("Keywords    : Compiler, Tools")
whatis("URL         : https://www.gnu.org/software/binutils/")
whatis("Description : Loads BinUtils")

prepend_path("PATH",  bin)
prepend_path("LD_LIBRARY_PATH", lib)
prepend_path("CPATH",  include)
prepend_path("MANPATH", man)
prepend_path("INFOPATH", info)

prepend_path("LIBRARY_PATH",  lib)