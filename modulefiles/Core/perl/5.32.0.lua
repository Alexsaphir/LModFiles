local apps = "/opt/apps"
local name = myModuleName()
local version = myModuleVersion()

local pkg = pathJoin(apps, name, version)

local bin = pathJoin(pkg, "bin")
local lib = pathJoin(pkg, "lib")
local man = pathJoin(pkg, "man")

family('perl')

help("This module load Perl 5.32.0 into the environment.")

whatis("Loads Perl")

prepend_path("PATH",  bin)
prepend_path("LD_LIBRARY_PATH", lib)
prepend_path("MANPATH", man)