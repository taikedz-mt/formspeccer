formspeccer = {}
local forms = {}

local colours = {
	red="#ff0000",
	green="#00ff00",
	blue="#0000ff",
	yellow="#ffff00",
	cyan="#00ffff",
	magenta="#ff00ff",
	white="#ffffff",
	black="#000000",
	lightgrey="#cccccc",
	mediumgrey="#999999",
	darkgrey="#333333",
}

local lookupcolour = function(colourname)
	local thecolor = colours[colourname]
	if thecolour == nil then
		return colourname -- it might already be a code in itself
	end
	return thecolour
end

formspeccer.newform = function(self,formname,formsize,prefs)
	if forms[formname] ~= nil then
		minetest.log("error","Form "..formname.." already exists!!")
		return -- how to cleanly indicate error and prevent loading?
	end
	forms[formname] = 'size['..formsize..']'
	if prefs then
		local pstring = ''
		for prefname,value in pairs(prefs) do
			if prefname == "bgcolor" then
				pstring = pstring .. "bgcolor["..lookupcolour(value).."]"
			elseif prefname == "background" then
				pstring = pstring .. "background["
				pstring = pstring .. value.xy .. ';'
				pstring = pstring .. value.wh .. ';'
				pstring = pstring .. value.texture
				if value.auto_clip ~= false then -- anything different from false, including nil
					pstring = pstring .. ";true"
				end
				pstring = pstring .. "]"
			end
		end
		forms[formname] = forms[formname] .. pstring
	end
	return formname
end

formspeccer.add_label = function(self,form,def,vertical)
	local fieldstring = 'label['
	if vertical then fieldstring = 'vertlabel[' end

	fieldstring = fieldstring .. def.xy .. ';'

	fieldstring = fieldstring .. def.label .. ';'
	fieldstring = fieldstring .. ']'

	forms[form] = forms[form]..fieldstring
end

formspeccer.add_field = function(self,form,def,password)
	local fieldstring = 'field['

	if def.xy and def.wh then
		if password then fieldstring = 'pwdfield[' end

		fieldstring = fieldstring .. def.xy .. ';'
		fieldstring = fieldstring .. def.wh .. ';'
	elseif forms[form]:find('].') then
		minetest.log("warning","There should only be one non-positioned field in a form.")
		minetest.log("warning","Got: "..forms[form])
	end

	fieldstring = fieldstring .. def.name .. ';'
	fieldstring = fieldstring .. def.label

	local content = def.value
	if content == nil then content = '' end

	if not password then
		fieldstring = fieldstring .. ';'.. content .. ';'
	end

	fieldstring = fieldstring .. ']'

	forms[form] = forms[form]..fieldstring
end

formspeccer.add_button = function(self,form,def,exit)
	
	local bstring = 'button'
	if def.texture then bstring = 'image_button' end
	if exit then bstring = bstring .. '_exit' end
	bstring = bstring ..'['

	bstring = bstring .. def.xy .. ';'
	bstring = bstring .. def.wh .. ';'
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
	lstring = lstring .. def.xy .. ';'
	lstring = lstring .. def.wh 
	if def.startindex then
		lstring = lstring .. ';' .. def.start_index
	end
	lstring = lsting .. ']'
	forms[form] = forms[form] .. lstring
end

formspeccer.add_choice_list = function(self,form,def,multichoice,transparent)
	local lstring = 'dropdown['
	if multichoice then lstring = 'textlist[' end

	lstring = lstring .. def.xy .. ';'
	lstring = lstring .. def.wh .. ';'
	lstring = lstring .. def.name .. ';'

	lstring = lstring .. def.choices[1]
	for i=2,#def.choices do
		lstring = lstring .. ',' .. def.choices[i]
	end
	if def.index then
		lstring = lstring .. ';'..def.index

		if transparent and multichoice then
			lstring = lstring .. ';true'
		end
	else
		lstring = lstring .. ';1'
	end
	lstring = lstring .. ']'
	forms[form] = forms[form] .. lstring
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
