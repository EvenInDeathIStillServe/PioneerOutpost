area/elevator
	name = "elevator"
	icon_state = "elevator"
	var/id = 1

area/elevator/proc/move_contents(var/levels)
	var/list/A = src.contents
	for(var/atom/movable/B in A)
		B.Move((locate(B.x, B.y, B.z - levels)))