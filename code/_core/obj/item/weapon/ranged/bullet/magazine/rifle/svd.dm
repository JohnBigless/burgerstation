/obj/item/weapon/ranged/bullet/magazine/rifle/svd
	name = "\improper 7.62x54mmR SVD Dragunov"
	desc = "For when you want to spread communism at an extended range."
	desc_extended = "Originally developed in 1958 and still used as the primary Designated Marskman weapon pretty much everywhere, proving the superiority of Soviet Engineering."
	icon = 'icons/obj/item/weapons/ranged/rifle/762_snipe.dmi'
	icon_state = "inventory"

	shoot_delay = 5

	automatic = FALSE

	shoot_sounds = list('sound/weapons/rifle_heavy/shoot.ogg')

	can_wield = TRUE
	wield_only = TRUE

	view_punch = 32

	slowdown_mul_held = HELD_SLOWDOWN_SNIPER_LARGE

	size = SIZE_5
	weight = WEIGHT_4

	heat_per_shot = 0.07
	heat_max = 0.07

	bullet_length_min = 46
	bullet_length_best = 54
	bullet_length_max = 58

	bullet_diameter_min = 7.6
	bullet_diameter_best = 7.62
	bullet_diameter_max = 7.7

	size = SIZE_4
	weight = WEIGHT_5

	value = 400

	ai_heat_sensitivity = 2

	zoom_mul = 2

/obj/item/weapon/ranged/bullet/magazine/rifle/svd/get_static_spread() //Base spread
	return 0

/obj/item/weapon/ranged/bullet/magazine/rifle/svd/get_skill_spread(var/mob/living/L) //Base spread
	return max(0,0.01 - (0.01 * L.get_skill_power(SKILL_RANGED)))


/obj/item/weapon/ranged/bullet/magazine/rifle/svd/get_bullet_inaccuracy(var/mob/living/L,var/atom/target,var/obj/projectile/P,var/inaccuracy_modifier)

	var/distance = get_dist(L,target)

	if(distance <= 3)
		return TILE_SIZE*0.5 //No using snipers at close range.

	if(distance <= VIEW_RANGE*0.5)
		return max(0,1 - L.get_skill_power(SKILL_PRECISION)) * ((VIEW_RANGE*0.5)/get_dist(L,target)) * TILE_SIZE*0.5

	return max(0,1 - L.get_skill_power(SKILL_PRECISION))*(0.1+0.9*(get_dist(L,target) - VIEW_RANGE*0.5)) * (L.client && L.client.is_zoomed ? 0.25 : 1)