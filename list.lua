
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
	self:add_element( form, lstring )
end

