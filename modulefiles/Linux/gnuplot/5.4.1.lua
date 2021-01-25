local apps = "/opt/apps"
local name = myModuleName()
local version = myModuleVersion()

local pkg = pathJoin(apps, name, version)

local bin = pathJoin(pkg, "bin")
local man = pathJoin(pkg, "share/man")

family("gnuplot")

help( "This module loads Gnuplot "..version.." into the environment.")

whatis("Version "..version)
whatis("Keywords: Utility, Graphic")
whatis("URL: http://gnuplot.info/")
whatis("Description: Loads the gnuplot plotting software")

prepend_path("PATH", bin)
prepend_path("MANPATH", man)