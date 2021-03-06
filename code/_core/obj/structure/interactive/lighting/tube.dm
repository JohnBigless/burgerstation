/obj/structure/interactive/lighting/tube
	name = "tube light"
	desc = "An electrical storm has been detected in proximity of the station. Please check all equipment for potential overloads."
	desc_extended = "Used to light up the area."

	icon = 'icons/obj/structure/lights_new.dmi'
	icon_state = "tube_light"

	desired_light_power = 0.3
	desired_light_range = 7
	desired_light_color = null //Set in update_icon

	layer = LAYER_LARGE_OBJ
	plane = PLANE_WALL_ATTACHMENTS

	var/on = TRUE

	color = COLOR_LIGHT
	var/color_frame = COLOR_GREY

	rotation_mod = -1

	collision_bullet_flags = FLAG_COLLISION_SPECIFIC

	health = /health/construction

	health_base = 10

/obj/structure/interactive/lighting/tube/on_destruction(var/atom/caller,var/damage = FALSE)

	if(desired_light_color)
		desired_light_color = null
		if(health)
			health.restore()
		create_destruction(get_turf(src),list(/obj/item/material/shard = 1),/material/glass)
		update_sprite()
	else
		create_destruction(get_turf(src),list(/obj/item/material/sheet = 1),/material/steel)
		qdel(src)

	return TRUE

/obj/structure/interactive/lighting/tube/New()

	. = ..()

	switch(dir)
		if(NORTH)
			pixel_y = 1
		if(SOUTH)
			pixel_y = -1
		if(EAST)
			pixel_x = 1
		if(WEST)
			pixel_x = -1

	return .

/obj/structure/interactive/lighting/tube/Initialize()

	if(color)
		desired_light_color = color
		color = "#FFFFFF"

	return ..()

/obj/structure/interactive/lighting/tube/PostInitialize()
	. = ..()
	update_sprite()
	return .

/obj/structure/interactive/lighting/tube/update_icon()

	icon = initial(icon)
	icon_state = initial(icon_state)

	var/icon/I = new /icon(icon,"tube")
	I.Blend(color_frame,ICON_MULTIPLY)

	if(desired_light_color)
		var/icon/F = new /icon(icon,"tube_bulb")
		F.Blend(desired_light_color,ICON_MULTIPLY)
		I.Blend(F,ICON_OVERLAY)
		set_light(on ? desired_light_range : 0, on ? desired_light_power : 0, desired_light_color)
	else
		set_light(FALSE)

	icon = I

/obj/structure/interactive/lighting/tube/update_overlays()

	. = ..()

	if(on && desired_light_color)
		var/image/IS = new/image(initial(icon),"tube_light")
		IS.plane = PLANE_LIGHTING
		IS.layer = 99
		IS.color = desired_light_color
		add_overlay(IS)

	return .

/obj/structure/interactive/lighting/tube/strong
	desired_light_power = 0.4
	desired_light_range = 8

/obj/structure/interactive/lighting/tube/stronger
	desired_light_power = 0.5
	desired_light_range = 16


/obj/structure/interactive/lighting/tube/color
	name = "colored light"
	color = "#FFFFFF"

	desired_light_power = 1
	desired_light_range = 3


/obj/structure/interactive/lighting/tube/syndicate
	color = "#FFBABA"
	color_frame = "#666666"
	desired_light_power = 0.25
	desired_light_range = 7

/obj/structure/interactive/lighting/tube/color/turf/Initialize()

	if(loc)
		color = loc.color
		name = loc.color

	return ..()
