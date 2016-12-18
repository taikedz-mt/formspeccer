
formspeccer.add_label = function(self,form,def,vertical)
	local fieldstring = 'label['
	if vertical then fieldstring = 'vertlabel[' end

	fieldstring = fieldstring .. def.xy .. ';'

	fieldstring = fieldstring .. def.label 
	fieldstring = fieldstring .. ']'

	self:add_element(form, fieldstring)
end

