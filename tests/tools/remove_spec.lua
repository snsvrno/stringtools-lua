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
local remove = stringtools.remove

describe("checks removing characters",function()
	local tests = {
		{ 'asdhjasd asdakshjdgs 7 7s 77 sd8s8d asd asd as as		 ',' ','asdhjasdasdakshjdgs77s77sd8s8dasdasdasas' },
		{'asdjjasdkkasduuhbbasdnbasdnasdmma asd asdasdasd masdasd','asd','jjkkuuhbbnbnmma   m' }
	}

	for _,t in pairs(tests) do
		it("// checking removal with characters = '" .. t[2] .. "'",function()
			assert.are.equal(t[3],remove(t[1],t[2]))
		end)
	end
end)