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
local trim = stringtools.trim

describe("trim()",function()
	-- creates the test stuff

	it("should be a single",function()
		local trimmed = trim("	 this	 "," ")

		assert.are.equal("this",trimmed)
	end)


	it("should be a multiple",function()
		local trimmed = trim("**  **  this  **  **",{ " ", "*" })

		assert.are.equal("this",trimmed)
	end)
end)