/atom
	var/tmp/move = 1
	var/delay = 2
	var/anchored = 0

/atom/proc/examine(mob/user)
	if(src == user)
		user << "Hey! It's me, \icon[src] <b>[src]!</b>"
	else if(istype(src,/mob/human))
		user << "That's our friend, \icon[src] <b>[src]</b>"
	else
		user << "That's \icon[src] \a <b>[src]</b>. [src.desc]"

datum/master_controller/New()
	spawn(1)
		process()

datum/master_controller/proc/process()
	for(var/obj/machinery/M in world)
		M.process()
	spawn(10)
		process()

/atom/proc/process()

/proc/get_turf(atom/location)
	while(location)
		if(isturf(location))
			return location
		location = location.loc
	return null