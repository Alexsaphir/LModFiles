local apps = "/opt/apps"
local name = myModuleName()
local version = myModuleVersion()

local pkg = pathJoin(apps, name, version)
local bin = pathJoin(pkg, "bin")
local man = pathJoin(pkg, "share/man")


family('nvtop')

help("This module load NvTop " .. version .. " into the environment.")

whatis("Name        : " .. name)
whatis("Version     : " .. version)
whatis("Keywords    : NVIDIA, Monitoring")
whatis("URL         : ")
whatis("Description : Loads Nvtop")

prepend_path("PATH", bin)
prepend_path("MANPATH", man)
