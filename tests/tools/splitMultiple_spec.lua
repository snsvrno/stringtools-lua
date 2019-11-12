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
local splitMultiple = stringtools._splitMultiple

describe("checks multiple splitting", function ()
    -- creates the test objects
    local items = { "aa|bb|cc", "aa;bb}cc" }
    local delims = { "|", ";", "}" }
    local results = { "aa", "bb", "cc" }

    for _,item in pairs(items) do
        it("checking splitMultiple function // '" .. item .. "'" ,function()
            local splitString = splitMultiple(item,delims)

            for i = 1, #splitString do
                assert.are.equal(splitString[i], results[i])
            end

        end)
    end
end)