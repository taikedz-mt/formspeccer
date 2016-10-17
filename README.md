# Minetest FormSpeccer

(C) Tai Kedzierski

License: LGPLv3

A lightweight mini-API for creating and managing formspecs without having to contend with its... _specialised_ syntax....

Currently supports

* `field`
* `button`, `button_exit`, `image_button`, `image_button_exit`
* `image`
* `list`

More will be added as I progress


## Example

Add a dependency to formspeccer, then use the `formspeccer` object to manage formspecs.

Note that coordinates are expressed not in pixels but in a pieces of a grid. For brevity, and to distinguish from actual coordinates, I chose to simply supply them as comma-separated string vlues.

	local formname = "mymod:myform"

	formspeccer:newform(formname,"10,7") -- a new form , 10x7
	formspeccer:add_field(formname,{
		name="field1",
		label="Your name",
		value="Sam", -- optional pre-populated value for the form
	})
	formspeccer:add_button(
		{
			name="send",
			label="Send!",
			xy="2,3",
			wh="1,1",
		},
		true -- optional , makes it an exit button
	)

	-- just show the form to a player
	formspeccer:show(player,"mymod:myform)

	-- this will error because the form already exists
	formspeccer:newform(formname,"10,7")

	-- clear the named form and start again
	formspeccer:clear("mymod:myform")

	minetest.show_formspec(player:get_player_name(),
		formspeccer:to_string(formname) -- returns the formspec raw string
	)
