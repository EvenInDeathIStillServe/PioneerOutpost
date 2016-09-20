mob/Login()
	if(!loc)
		loc = locate(/turf/floor/spawnpoint)
	player_list |= src

mob/Logout()
	player_list -= src

atom/movable/Move(var/forced=0)
	if(anchored && !forced)
		return
	if(src.move)
		src.move=0
		..()
		sleep(src.delay)
		src.move=1

mob/verb/examinate(atom/A as mob|obj|turf in view())
	set name = "Examine"
	set category = "IC"

	face_atom(A)
	A.examine(src)

mob/Bumped(var/atom/movable/AM)
	if(istype(AM,/mob))
		var/original_loc = src.loc
		var/target_loc = AM.loc
		src.loc = target_loc
		AM.loc = original_loc

mob/proc/pickup(var/obj/item/pickedup)

mob/proc/unequip(var/obj/item/unequipped)

mob/proc/interact(var/atom/interacted)

mob/proc/drop()

mob/proc/getridof(var/obj/item/riddenof)

mob/proc/get_active_hand()

mob
	var/obj/item/holding = null
	var/hand = 1
	var/last_click = null

	var/obj/screen/drop = null
	var/obj/screen/take = null
	var/obj/screen/swap = null
	var/obj/screen/righthand = null
	var/obj/screen/lefthand = null
	var/obj/screen/selector = null