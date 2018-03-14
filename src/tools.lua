-- dumby comment

local TOOLS = { }

function TOOLS.split(string,delim)
  -----------------------------------------------------
  -- splits a string using the delim

  -- string : string            string to split
  -- delim : string             delim to use for splitting, can be any length
  --
  -- return : table (array)     returns a table with the split sections
  -----------------------------------------------------
  returner = { }

  shortString = ''
  skip = 0
  for i=1,(#string+1-#delim) do
    if skip > 0 then
      skip = skip - 1
    else
      if string:sub(i,i-1+#delim) == delim then
        returner[#returner+1] = shortString
        shortString = ''
        skip = #delim - 1
      else
        shortString = shortString .. string:sub(i,i)
  end end end
  --  last add bits
  shortString = shortString .. string:sub(#string+2-#delim+skip,#string)
  returner[#returner+1] = shortString

  return returner
end

function TOOLS.remove(string,characters)
  -----------------------------------------------------
  -- removes all instances of the character from the string

  -- string : string            string to split
  -- characters : string        delim to use for splitting, can be any length
  --
  -- return : string            new string without the character
  -----------------------------------------------------

  local splits = TOOLS.split(string,characters)
  local returner = ''
  for _,v in pairs(splits) do
    returner = returner .. v end

  return returner
end

function TOOLS.removeLeading(string,characters)
  -----------------------------------------------------
  -- removes all leading instances of the characters

  -- string : string            string to split
  -- characters : string        delim to use for splitting, can be any length
  --
  -- return : string            new string without the character
  -----------------------------------------------------
  local newString = ''

  local start = true
  local istart = 1

  for i=1,#string-(#characters-1),#characters do
    if start then 
      if string:sub(i,i+(#characters-1)) ~= characters then 
        start = false 
        istart = i
  end end end 
  return string:sub(istart,#string)
end

return TOOLS
