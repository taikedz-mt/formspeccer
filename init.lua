formspeccer = {}
local forms = {}

formspeccer.newform = function(self,formname,formsize)
	if forms[formname] ~= nil then
		minetest.log("error","Form "..formname.." already exists!!")
		return -- how to cleanly indicate error and prevent loading?
	end
	forms[formname] = 'size['..formsize..']'
	return formname
end

formspeccer.add_field = function(self,form,def)
	local fieldstring = 'field['
	if def.x and def.y and def.w and def.h then
		fieldstring = fieldstring .. def.x .. ',' .. def.y .. ';'
		fieldstring = fieldstring .. def.w .. ',' .. def.h .. ';'
	elseif forms[form]:find('].') then
		minetest.log("warning","There should only be one non-positioned field in a form.")
		minetest.log("warning","Got: "..forms[form])
	end

	fieldstring = fieldstring .. def.name .. ';'
	fieldstring = fieldstring .. def.label .. ';'
	local content = def.value
	if content == nil then content = '' end

	fieldstring = fieldstring .. content .. ';'

	fieldstring = fieldstring .. ']'

	forms[form] = forms[form]..fieldstring
end

formspeccer.add_button = function(self,form,def,exit)
	
	local bstring = 'button'
	if def.texture then bstring = 'image_button' end
	if exit then bstring = bstring .. '_exit' end
	bstring = bstring ..'['

	bstring = bstring .. def.x .. ',' .. def.y .. ';'
	bstring = bstring .. def.w .. ',' .. def.h .. ';'
	if def.texture then
		bstring = bstring .. def.texture .. ';'
	end
	bstring = bstring .. def.name .. ';'
	bstring = bstring .. def.label 
	bstring = bstring .. ']'
	forms[form] = forms[form] .. bstring
end

formspeccer.add_list = function(self,form,def)
	local lstring = 'list['
	lstring = lstring .. def.location .. ';'
	lstring = lstring .. def.name .. ';'
	lstring = lstring .. def.x .. ',' .. def.y .. ';'
	lstring = lstring .. def.w .. ',' .. def.h 
	if def.startindex then
		lstring = lstring .. ';' .. def.start_index
	end
end

formspeccer.to_string = function(self,formname)
	return forms[formname]
end

formspeccer.show = function(self,player,formname)
	minetest.show_formspec(player:get_player_name(),formname,forms[formname])
end

formspeccer.clear = function(self,formname)
	forms[formname] = nil
end
