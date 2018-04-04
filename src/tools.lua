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

function TOOLS.splitMultiple(string,delims)
  -----------------------------------------------------
  -- splits a string by multiple delims at once.

  -- string : string                        string to split
  -- delims : table (array) of strings      array of delims to use for splitting
  --
  -- return : table (array)                 returns a table with the split sections
  -----------------------------------------------------
  local parts = { string }
  for _,d in pairs(delims) do
    for pi=#parts,1,-1 do
      local splitParts = TOOLS.split(parts[pi],d)
      table.remove(parts,pi)
      for i=1,#splitParts do
        table.insert(parts,pi + (i-1),splitParts[i])
      end
  end end
  return parts
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
