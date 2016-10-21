
formspeccer.add_textarea = function(self,form,def)
	-- textarea[X,Y;W,H;name;label;default]
	local fstring = 'textarea['
	fstring = fstring .. def.xy .. ';'
	fstring = fstring .. def.wh .. ';'
	fstring = fstring .. def.name .. ';'
	fstring = fstring .. def.label

	if def.value ~= nil then
		fstring = fstring .. ';'.. minetest.formspec_escape(tostring(def.value))
	end
	fstring = fstring .. ']'
	self:add_element(form, fstring)
end

