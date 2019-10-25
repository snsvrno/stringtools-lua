-- loads all the parts
local tools = require((...):gsub('%.init$', '') .. '.src.tools')
tools.addToMetatable = require((...):gsub('%.init$', '') .. '.src.metatableImport')

-- library information
tools._version = "1.1.0"
tools._name = "stringtools"
tools._author = "snsvrno <snsvrno@tuta.io>"

return tools