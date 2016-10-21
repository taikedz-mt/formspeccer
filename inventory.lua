-- confusingly named, this is actually an inventory

formspeccer.add_inventory = function(self,form,def)
	local lstring = 'list['
	lstring = lstring .. def.location .. ';'
	lstring = lstring .. def.name .. ';'
	lstring = lstring .. def.xy .. ';'
	lstring = lstring .. def.wh 
	if def.startindex then
		lstring = lstring .. ';' .. def.start_index
	end
	lstring = lstring .. ']'
	self:add_element( form, lstring )
end
