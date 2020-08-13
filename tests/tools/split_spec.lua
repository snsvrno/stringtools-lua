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
local split = stringtools.split

describe("checks splitting",function()
	-- creates the test stuff

	it("should be a single",function()
		local splitString = split("this is		   a string"," ")

		assert.are.equal("this",splitString[1])
		assert.are.equal("is",splitString[2])
		assert.are.equal("a",splitString[3])
		assert.are.equal("string",splitString[4])
	end)


	it("should be a multiple",function()
		local splitString = split("this is a string",{ " ", "i" })

		assert.are.equal("th",splitString[1])
		assert.are.equal("s",splitString[2])
		assert.are.equal("s",splitString[3])
		assert.are.equal("a",splitString[4])
		assert.are.equal("str",splitString[5])
		assert.are.equal("ng",splitString[6])
	end)
end)