turf/floor
	icon = 'icons/floors.dmi'

turf/floor/Enter()
	for(var/obj/O in src.contents)
		if(O.density)
			return 0
	return 1

turf/proc/ChangeTurf(var/turf/N)
	var/turf/W = new N(src)
	return W

turf/floor/grass
	name = "grass"
	icon_state = "grass"

turf/floor/grass/attackby(obj/item/weapon/W, mob/user)
	if(istype(W, /obj/item/planks))
		user << "You lay down some wooden floor."
		src.ChangeTurf(/turf/floor/wood)
		del W
	if(istype(W, /obj/item/acorn))
		user << "You plant [W] in the soil."
		new /obj/structure/sapling(src)
		del W

turf/floor/wood
	name = "wooden floor"
	icon_state = "wood"

turf/floor/wood/attackby(obj/item/weapon/W, mob/user)
	if(istype(W, /obj/item/planks))
		user << "You build a wooden wall."
		src.ChangeTurf(/turf/wall/wood)
		del W

turf/floor/rock
	name = "rock floor"
	icon_state = "rock"

turf/floor/spawnpoint
	name = "spawn point"
	icon_state = "spawnpoint"

turf/wall
	icon = 'icons/walls.dmi'
	density = 1
	opacity = 1

turf/wall/rock
	name = "rock wall"
	icon_state = "rock"

turf/wall/rock/attackby(obj/item/weapon/W, mob/user)
	if(istype(W, /obj/item/weapon/pickaxe))
		user << "You smash [src] down!"
		switch(rand(1,4))
			if(1)
				new/obj/item/ore/iron(src)
			if(2)
				new/obj/item/ore/gold(src)
		src.ChangeTurf(/turf/floor/rock)

turf/wall/rock/attack_hand(mob/user)
	user << "You touch [src]."

turf/wall/wood
	name = "wood wall"
	icon_state = "wood"