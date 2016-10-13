turf/floor/openspace
	name = "open space"
	icon_state = "openspace"
	var/floorbelow

turf/floor/openspace/New()
	getbelow()

turf/floor/openspace/proc/getbelow()
	floorbelow = locate(src.x, src.y, src.z + 1)

turf/floor/openspace/Enter()
	if(..())
		spawn(1)
			usr.loc = floorbelow
			usr << "You fall down!"