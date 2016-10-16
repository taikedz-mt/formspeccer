formspeccer = {}

formspeccer.newform = function(self,formname,formsize)
	-- TODO - check that the mod name matches current mod
	if self[formname] ~= nil then -- shim -- need to require a proper itemstring
		minetest.log("error","Form "..formname.." already exists!!")
		return -- how to cleanly indicate error and prevent loading?
	end
	self[formname] = 'size['..formsize..']'
	return formname
end

formspeccer.add_field = function(self,form,def)
	local fieldstring = 'field['
	fieldstring = fieldstring .. def.name .. ';'
	fieldstring = fieldstring .. def.label .. ';'
	local content = def.value
	if content == nil then content = '' end

	fieldstring = fieldstring .. content .. ';'

	fieldstring = fieldstring .. ']'

	self[form] = self[form]..fieldstring
end

formspeccer.add_button = function(self,form,def)
	local bstring = 'button['
	bstring = bstring .. def.x .. ',' .. def.y .. ';'
	bstring = bstring .. def.w .. ',' .. def.h .. ';'
	bstring = bstring .. def.name .. ';'
	bstring = bstring .. def.label 
	bstring = bstring .. ']'
	self[form] = self[form] .. bstring
end

formspeccer.to_string = function(self,formname)
	return self[formname]
end

formspeccer.show = function(self,player,formname)
	minetest.show_formspec(player:get_player_name(),formname,self[formname])
end

formspeccer.clear = function(self,formname)
	self[formname] = nil
end
