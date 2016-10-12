/*
	These are simple defaults for your project.
 */

world
	fps = 25		// 25 frames per second
	icon_size = 32	// 32x32 icon size by default

	view = 6		// show up to 6 tiles outward from center (13x13 view)

var/master_controller
var/money = 100
var/stock = 0
var/list/player_list
var/list/clients


// Make objects move 8 pixels per tick when walking

mob
	step_size = 32

obj
	step_size = 32

world/New()
	master_controller = new /datum/master_controller()
