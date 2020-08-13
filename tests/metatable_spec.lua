-- this test is assuming that this project and it's dependencies
-- are located in the same root folder, like maybe a `libraries`
-- folder or something, that way it can find the correct dependencies
for _,v in pairs(arg) do
	if (v ~= '--console') and (v ~= 'embedded boot.lua') and (v:find('.exe') == nil ) then
		package.path = './../?/init.lua;./../?.lua;' .. package.path
	end
end

-- testing the metatable import
require('stringtools-lua'):addToMetatable()

describe("Metatable Import",function()
	it("Metatable importing works",function()
		local string = "asd"
		assert.are.equals(string:split("s")[1],"a")
	end)
end)