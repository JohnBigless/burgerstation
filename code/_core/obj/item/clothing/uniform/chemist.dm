/obj/item/clothing/uniform/chemist
	name = "\improper Chemist's uniform"
	desc = "Who wants to try my Polytrinic Acid flavored Candy?"
	desc_extended = "The uniform of druglord- I mean, chemists."
	icon = 'icons/obj/item/clothing/uniforms/chemist.dmi'

	item_slot = SLOT_TORSO | SLOT_GROIN

	flags_clothing = FLAG_CLOTHING_NOBEAST_FEET

	defense_rating = list(
		BLADE = 10,
		BLUNT = 10,
		PIERCE = 10,
		LASER = 10,
		MAGIC = 25,
		HEAT = 15,
		COLD = 15,
		BOMB = 25,
		BIO = 50
	)

	value = 20