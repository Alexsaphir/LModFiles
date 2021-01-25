local apps = "/opt/apps"
local name = myModuleName()
local version = myModuleVersion()

local pkg = pathJoin(apps, name, version)

local bin = pathJoin(pkg, "bin")
local man = pathJoin(pkg, "man")
local info = pathJoin(pkg, "share/info")

family("cmake")

help("This module loads CMake " .. version .. " into the environment.")

whatis("Name        : " .. name)
whatis("Version     : " .. version)
whatis("Keywords    : Compiler, Tools")
whatis("URL         : https://cmake.org/")
whatis("Description : Loads CMake")

prepend_path("PATH", bin)
prepend_path("MANPATH", man)
prepend_path("INFOPATH", info)