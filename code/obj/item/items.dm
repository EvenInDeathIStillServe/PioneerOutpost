obj/item/wood
	name = "wood"
	desc = "Got wood?"
	icon_state = "wood"

obj/item/planks
	name = "planks"
	desc = "It's a bunch of planks. Good for woodworking."
	icon_state = "planks"

obj/item/acorn
	name = "acorn"
	desc = "This turns into a tree when planted in soil. Crazy how nature does that."
	icon_state = "acorn"

obj/item/ore/iron
	name = "iron ore"
	desc = "Sin(12)? 1. 0.43837114678/2. 0.58778525229/ 3. 0.95105651629/ 4. 0.20791169081"
	icon_state = "iron_ore"

obj/item/ore/gold
	name = "gold ore"
	desc = "We've struck gold!"
	icon_state = "gold_ore"

/obj/item/ore/New()
	pixel_x = rand(0,8)-4
	pixel_y = rand(0,4)-4

obj/item/ingot/iron
	name = "iron ingot"
	desc = "This can be turned into a wide variety of objects."
	icon_state = "iron_ingot"

obj/item/ingot/gold
	name = "gold ingot"
	desc = "This thing's heavy! You could say it's worth its weight in gold."
	icon_state = "gold_ingot"

/obj/item/ingot/New()
	pixel_x = rand(0,8)-4
	pixel_y = rand(0,4)-4
