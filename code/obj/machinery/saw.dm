obj/machinery/saw
	name = "saw"
	desc = "I saw a guy fall asleep while working with one of these. He's not around anymore."
	icon_state = "saw"
	density = 1

obj/machinery/saw/Bumped(var/atom/movable/AM)
	if(!istype(AM,/obj/item/wood))
		return
	playsound(loc,'sounds/saw.ogg', 80, 0, 1)
	new/obj/item/planks(src.loc)
	del AM