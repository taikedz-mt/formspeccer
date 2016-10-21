
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
	self:add_element( form, bstring )
end

