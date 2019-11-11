-- this test is assuming that this project and it's dependencies
-- are located in the same root folder, like maybe a `libraries`
-- folder or something, that way it can find the correct dependencies
for _,v in pairs(arg) do
  if (v ~= '--console') and (v ~= 'embedded boot.lua') and (v:find('.exe') == nil ) then
    package.path = './../?/init.lua;./../?.lua;' .. package.path
end end

-- loading library
local S = require 'stringtools-lua' or nil

-- testing the metatable import
require('stringtools-lua'):addToMetatable()

describe("Stringtools",function()
  it("Loads the correct library",function()
    assert.are_not.equal(S,nil)
  end)

  describe("checks splitting",function()
    -- creates the test stuff
    local items = {'asd','131fs','dfggff','45456ashjj7'}
    local delims = { ',','||','<===>' }

    for _,d in pairs(delims) do
      local test = ''
      it("checks splitting // delim = '" .. d .. "'",function()
        for i,v in pairs(items) do test = test .. v; if i ~= #items then test = test  .. d end end
        local split = S.split(test,d)
        for i,v in pairs(items) do
          assert.are.equal(v,split[i])
        end
      end)
  end end)

  describe("checks mutliple splitting", function ()
    -- creates the test objects
    local items = { "aa|bb|cc","aa;bb}cc"}
    local delims = { "|",";","}" }

    it("checks mutliple splitting",function()
      local splitA = S.splitMultiple(items[1],delims)
      local splitB = S.splitMultiple(items[2],delims)

      for i,_ in pairs(splitA) do assert.are.equal(splitA[i],splitB[i]) end
      for i,_ in pairs(splitB) do assert.are.equal(splitA[i],splitB[i]) end

    end)


  end)

  describe("checks removing characters",function()
    local tests = {
      { 'asdhjasd asdakshjdgs 7 7s 77 sd8s8d asd asd as as     ',' ','asdhjasdasdakshjdgs77s77sd8s8dasdasdasas' },
      {'asdjjasdkkasduuhbbasdnbasdnasdmma asd asdasdasd masdasd','asd','jjkkuuhbbnbnmma   m' }
    }

    for _,t in pairs(tests) do
      it("// checking removal with characters = '" .. t[2] .. "'",function()
        assert.are.equal(t[3],S.remove(t[1],t[2]))
      end)
    end
  end)

  describe("checks removing leading characters",function()
    local tests = {
      {'i went to the store',' '},
      {'     i went to the store',' '},
      {'--------i went to the store','-'},
      {'asasasasasasasi went to the store','as'}
    }

    for _,t in pairs(tests) do
      it("// checking removal with characters = '" .. t[2] .. "'",function()
        assert.are.equal('i went to the store',S.removeLeading(t[1],t[2]))
      end)
    end
  end)

end)

describe("Metatable Import",function()
  it("Metatable importing works",function()
    local string = "asd"
    assert.are.equals(string:split("s")[1],"a")
  end)
end)