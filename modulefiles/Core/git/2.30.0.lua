always_load("perl/5.32.0")

local apps = "/opt/apps"
local name = myModuleName()
local version = myModuleVersion()

local pkg = pathJoin(apps, name, version)
local bin = pathJoin(pkg, "bin")

family('git')

help("This module load Git " .. version .. " into the environment.")

whatis("Name        : " .. name)
whatis("Version     : " .. version)
whatis("Keywords    : Versioning, GIT")
whatis("URL         : https://git-scm.com/")
whatis("Description : Loads Git")

prepend_path("PATH", bin)
