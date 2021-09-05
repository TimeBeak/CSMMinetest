--Death Coords By Niden

--Chat Message
core.register_on_death(function()
  local pos = minetest.localplayer:get_pos(); minetest.display_chat_message((core.get_color_escape_sequence("#FF0000") .."*** CSM - LAST DEAD AT: " .. pos.x .. ", " .. pos.y .. ", " .. pos.z ))
end
)

--FormSpec
core.register_on_death(function()
	core.display_chat_message("You died.")
	local pos = minetest.localplayer:get_pos();
	local formspec = "size[16,9]bgcolor[#320000b4;true]" ..
		"label[4,1.60;" .. fgettext("                                       YOU DIE.      \n \nDEAD AT: " .. pos.x .. " " .. pos.y .. " " .. pos.z) ..
		"]button_exit[6.6,8;3,0.8;btn_respawn;".. fgettext("OK") .."]"
	core.show_formspec("bultin:death", formspec)
end)

core.register_on_formspec_input(function(formname, fields)
	if formname == "bultin:death" then
		core.send_respawn()
	end
end)
