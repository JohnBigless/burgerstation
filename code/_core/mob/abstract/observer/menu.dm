/mob/abstract/observer/menu
	spawning_buttons = list(
		/obj/hud/button/menu/title,
		/obj/hud/button/menu/selection/character_new,
		/obj/hud/button/menu/selection/character_load,
		/obj/hud/button/menu/selection/observe,
		/obj/hud/button/menu/selection/macros
	)

	alpha = 0

	anchored = TRUE

	var/current_lobby_position = 1
	var/next_lobby_cycle = SECONDS_TO_DECISECONDS(10)

/mob/abstract/observer/menu/do_say(var/text_to_say, var/should_sanitize = TRUE, var/talk_type_to_use = TEXT_TALK)
	return FALSE

/mob/abstract/observer/menu/think()

	. = ..()

	next_lobby_cycle -= 1 //This runs every decisecond.
	if(next_lobby_cycle <= 0)
		current_lobby_position++
		if(current_lobby_position >= length(lobby_positions))
			current_lobby_position = 1
		force_move(get_turf(lobby_positions[current_lobby_position]))
		next_lobby_cycle = initial(next_lobby_cycle)

	return .

/mob/abstract/observer/menu/PostInitialize()
	. = ..()
	start_thinking(src)
	return .