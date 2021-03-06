/obj/item/clothing/overwear/armor/bone_armor
	name = "bone armor"
	icon = 'icons/obj/item/clothing/suit/bone_armor.dmi'
	desc = "I've got a BONE to pick with ya!"
	desc_extended = "Armor made from bones. Metal as fuck."
	item_slot = SLOT_TORSO_A
	worn_layer = LAYER_MOB_CLOTHING_HARDSUIT
	rarity = RARITY_RARE

	protected_limbs = list(BODY_TORSO,BODY_GROIN,BODY_ARM_LEFT,BODY_ARM_RIGHT,BODY_HAND_LEFT,BODY_HAND_RIGHT,BODY_LEG_LEFT,BODY_LEG_RIGHT)

	defense_rating = list(
		BLADE = 75,
		BLUNT = 25,
		PIERCE = 25,
		MAGIC = 25,
		HEAT = 50,
		COLD = 25
	)

	size = SIZE_6
	weight = WEIGHT_4

	value = 500

	blocks_clothing = SLOT_TORSO_A