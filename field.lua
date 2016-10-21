
formspeccer.add_field = function(self,form,def,password)
	local fieldstring = 'field['
	local current_data = self:to_string(form)

	if def.xy and def.wh then
		if password then fieldstring = 'pwdfield[' end

		fieldstring = fieldstring .. def.xy .. ';'
		fieldstring = fieldstring .. def.wh .. ';'

	elseif current_data:find('].') then -- look for a closing bracket AND extra data
		minetest.log("warning","Non-positioned field shuold be the first and only field.")
		minetest.log("warning","Got: "..current_data)
	end

	fieldstring = fieldstring .. def.name .. ';'
	fieldstring = fieldstring .. def.label

	local content = def.value
	if content == nil then content = '' end

	if not password then
		fieldstring = fieldstring .. ';'.. content 
	end

	fieldstring = fieldstring .. ']'

	self:add_element(form,fieldstring)
end
