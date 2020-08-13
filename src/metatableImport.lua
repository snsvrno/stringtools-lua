local importer = function (parent)
  ----------------------------------------------------------------------------------
  -- used to import all the functions of the parent into the metatable of the object
  ----------------------------------------------------------------------------------

  -- finds the right metatable to use
  local mt = getmetatable("string")

  -- adds it to the metatable
  for i,v in pairs(parent) do
	if type(v) == 'function' then
	  mt.__index[i] = v
	end
  end

end

return importer