local apps = "/opt/apps"
local name = myModuleName()
local version = myModuleVersion()

local pkg = pathJoin(apps, name, version)

local bin = pathJoin(pkg, "bin")
local include = pathJoin(pkg, "include")
local lib = pathJoin(pkg, "lib")
local lib64 = pathJoin(pkg, "lib64")
local man = pathJoin(pkg, "share/man")
local info = pathJoin(pkg, "share/info")

family("compiler")

whatis("Name        : " .. name)
whatis("Version     : " .. version)
whatis("Keywords    : Compiler")
whatis("URL         : https://gcc.gnu.org/")
whatis("Description : Loads GCC")

prepend_path("PATH", bin)
prepend_path("GOPATH", bin)
prepend_path("CPATH", include)
prepend_path("LIBRARY_PATH", lib)
prepend_path("LD_LIBRARY_PATH", lib)
prepend_path("LD_LIBRARY_PATH", lib64)
prepend_path("LIBRARY_PATH", lib)
prepend_path("LIBRARY_PATH", lib64)
prepend_path("MANPATH", man)
prepend_path("INFOPATH", info)
