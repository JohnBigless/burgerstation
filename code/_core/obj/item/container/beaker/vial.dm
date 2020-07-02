/obj/item/container/beaker/vial
	name = "small vial"
	desc = "Careful to not drop this."
	desc_extended = "A vial. Often used by virologists to store viruses and blood samples."
	icon = 'icons/obj/item/container/cup/vial.dmi'
	icon_state = "vial"
	icon_count = 10

	reagents = /reagent_container/beaker/vial/

	value = 3


/obj/item/container/beaker/vial/stand


/obj/item/container/beaker/vial/stand
	name = "vial of stand powers"
	desc = "Hmm, tastes like a blended arrow."
	desc_extended = "A vial containing a bullshit virus that makes a funky half-naked person appear near you and punch people."

/obj/item/container/beaker/vial/stand/Generate()
	reagents.add_reagent(/reagent/magic/stand_juice,10)
	return ..()