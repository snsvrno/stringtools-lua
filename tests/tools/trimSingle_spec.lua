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
local trim = stringtools._trimSingle

describe("_trimSingle()",function()
	-- creates the test stuff

	it("something in the way",function()
		local trimmed = trim("  x   this	 "," ")

		assert.are.equal("x   this",trimmed)
	end)
end)