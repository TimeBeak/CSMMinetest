--Death Coords By Niden

core.register_on_death(function()
  local pos = minetest.localplayer:get_pos(); minetest.display_chat_message((core.get_color_escape_sequence("#FF0000") .."DEAD AT: " .. pos.x .. " " .. pos.y .. " " .. pos.z ))
end
)

--Death Coords FormSpec By Niden
core.register_on_death(function()
	core.display_chat_message("You died.")
	local pos = minetest.localplayer:get_pos();
	local formspec = "size[11,5.5]bgcolor[#320000b4;true]" ..
		"label[2,1.40;" .. fgettext("                                 You Die      \n \nDEAD AT: " .. pos.x .. " " .. pos.y .. " " .. pos.z) ..
		"]button_exit[4,3;3,0.5;btn_respawn;".. fgettext("Respawn") .."]"
	core.show_formspec("bultin:death", formspec)
end)

core.register_on_formspec_input(function(formname, fields)
	if formname == "bultin:death" then
		core.send_respawn()
	end
end)
