obj/structure/workbench

obj/structure/workbench/carpentry
	name = "carpentry workbench"
	desc = "Wood logs are turned into planks here."
	icon_state = "carpentry"

obj/structure/workbench/carpentry/attackby(var/obj/item/W, mob/user)
	if(istype(W, /obj/item/wood))
		user << "You saw [W] into planks."
		new /obj/item/planks(src.loc)
		del W