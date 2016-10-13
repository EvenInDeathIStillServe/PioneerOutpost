turf/floor/openspace
	name = "open space"
	icon_state = "openspace"

turf/floor/openspace/Enter()
	usr.Move(locate(src.x, src.y, src.z+1))
	usr << "You fall down!"