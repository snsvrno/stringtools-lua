-- this test is assuming that this project and it's dependencies
-- are located in the same root folder, like maybe a `libraries`
-- folder or something, that way it can find the correct dependencies
for _,v in pairs(arg) do
	if (v ~= '--console') and (v ~= 'embedded boot.lua') and (v:find('.exe') == nil ) then
		package.path = './../?/init.lua;./../?.lua;' .. package.path
	end
end

-- loading library
local stringtools = require 'stringtools-lua' or nil
local removeLeading = stringtools.removeLeading

describe("checks removing leading characters",function()
	local tests = {
		{'i went to the store',' '},
		{'		 i went to the store',' '},
		{'--------i went to the store','-'},
		{'asasasasasasasi went to the store','as'}
	}

	for _,t in pairs(tests) do
		it("// checking removal with characters = '" .. t[2] .. "'",function()
			assert.are.equal('i went to the store',removeLeading(t[1],t[2]))
		end)
	end
end)