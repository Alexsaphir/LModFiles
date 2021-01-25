local apps = "/opt/apps"
local name = myModuleName()
local version = myModuleVersion()

local pkg = pathJoin(apps, name, version)

local bin = pathJoin(pkg, "bin")
local include = pathJoin(pkg, "include")
local lib = pathJoin(pkg, "lib")
local man = pathJoin(pkg, "share/man")


family("python3")

whatis("Name        : " .. name)
whatis("Version     : " .. version)
whatis("Keywords    : Python")
whatis("URL         : https://www.python.org/")
whatis("Description : Loads Python3")

prepend_path("PATH", bin)
prepend_path("CPATH", include)
prepend_path("LIBRARY_PATH", lib)
prepend_path("MANPATH", man)

-- Setup Modulepath for packages built by this python stack
local mroot = os.getenv("MODULEPATH_ROOT")
local mdir = pathJoin(mroot,"python",version)
prepend_path("MODULEPATH", mdir)