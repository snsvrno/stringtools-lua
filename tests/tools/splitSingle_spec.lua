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
local splitSingle = stringtools._splitSingle

describe("checks splitting",function()
    -- creates the test stuff
    local items = {'asd','131fs','dfggff','45456ashjj7'}
    local delims = { ',','||','<===>' }

    for _,d in pairs(delims) do
        local test = ''
        it("checks splitting // delim = '" .. d .. "'",function()

            for i,v in pairs(items) do
                test = test .. v
                if i ~= #items then
                    test = test .. d
                end
            end

            local splitString = splitSingle(test,d)

            for i,v in pairs(items) do
                assert.are.equal(v,splitString[i])
            end
        end)
    end
end)