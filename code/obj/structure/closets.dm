obj/structure/closet
	name = "closet"
	desc = "You can store things in it."
	icon_state = "closet0"
	density = 1
	var/closed_icon = "closet0"
	var/open_icon = "closet1"
	var/opened = 0

obj/structure/closet/attack_hand(user)
	if(!opened)
		for(var/obj/item/I in src)
			I.loc = src.loc
		for(var/mob/M in src)
			M.loc = src.loc
		icon_state = open_icon
		opened = 1
		density = 0
	else
		for(var/obj/item/I in src.loc)
			I.loc = src
		for(var/mob/M in src.loc)
			M.loc = src
		icon_state = closed_icon
		opened = 0
		density = 1