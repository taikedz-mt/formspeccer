# Minetest FormSpeccer

A lightweight mini-API for creating and managing formspecs without having to contend with its /specialist/ syntax....

(C) Tai Kedzierski

License: LGPLv3

Currently supports

* `field`
* `button`

More will be added as I progress

Also to do:

* enforce usage of current mod name for the formspec name string
* move forms to a local variable
* make the form size dynamic depending on number of elements added
* make button placement automatic

## Example

Add a dependency to formspeccer, then use the `formspeccer` object to manage formspecs

	local formname = "mymod:myform"

	formspeccer:newform(formname,"10,7") -- a new form , 10x7
	formspeccer:add_field(formname,{
		name="field1",
		label="Your name",
		value="Sam", -- optional pre-populated value for the form
	})
	formspeccer:add_button({
		name="send",
		label="Send!",
	})

	-- just show the form to a player
	formspeccer:show(player,"mymod:myform)

	-- this will error because the form already exists
	formspeccer:newform(formname,"10,7")

	-- clear the named form and start again
	formspeccer:clear("mymod:myform")

	minetest.show_formspec(player:get_player_name(),
		formspeccer:to_string(formname) -- returns the formspec raw string
		)
