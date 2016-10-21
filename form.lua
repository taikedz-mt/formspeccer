
-- Form management

local forms = {}
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

formspeccer.add_element = function(self,formname,element_string)
	forms[formname] = forms[formname] .. element_string
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
