/obj/item/storage/heavy
	name = "heavy storage"
	desc = "I don't think anyone can pick this up."
	icon = 'icons/obj/items/storage/crates.dmi'
	icon_state = "crate"

	size = 100

	container_max_size = 99

	dynamic_inventory_count = 12

	anchored = TRUE

/obj/item/storage/heavy/clicked_by_object(var/mob/caller as mob,var/atom/object,location,control,params) //The src was clicked on by the object
	INTERACT_CHECK
	click_self(caller,location,control,params)
	return TRUE