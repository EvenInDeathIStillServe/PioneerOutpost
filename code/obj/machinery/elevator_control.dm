obj/machinery/elevator_control
	name = "elevator control"
	desc = "The power of elevation is at your disposal."
	icon_state = "elevator_control"
	var/id = 1
	var/levels_to_move = -1

obj/machinery/elevator_control/attack_hand(user)
	for(var/area/elevator/E in world)
		if(src.id == E.id)
			E.move_contents(levels_to_move)