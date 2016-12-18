formspeccer = {}

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


-- UI types

dofile(minetest.get_modpath('formspeccer')..'/form.lua' )
dofile(minetest.get_modpath('formspeccer')..'/button.lua' )
dofile(minetest.get_modpath('formspeccer')..'/field.lua' )
dofile(minetest.get_modpath('formspeccer')..'/label.lua' )
dofile(minetest.get_modpath('formspeccer')..'/list.lua' )
dofile(minetest.get_modpath('formspeccer')..'/inventory.lua' )
dofile(minetest.get_modpath('formspeccer')..'/textarea.lua' )
dofile(minetest.get_modpath('formspeccer')..'/tooltip.lua' )
