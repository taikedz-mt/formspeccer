formspeccer.add_tooltip = function(self, form, def)

	local bstring = 'tooltip'
	bstring = bstring ..'['

	bstring = bstring .. def.element .. ';'
	bstring = bstring .. def.text .. ';'
	bstring = bstring .. ']'
	self:add_element( form, bstring )
end

