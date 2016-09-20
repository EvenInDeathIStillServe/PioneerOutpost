obj/screen
		layer = UI_LAYER  // make it go over a person
		icon = 'icons/screen.dmi'  // its icon
		var/mob/human/owner = null

obj/screen/New(client/C)     //when a new client is made
	C.screen+=src  // add it to the clients screen
	owner = C.mob
	var/mob/M = C.mob
	switch(name)
		if("drop")
			M.drop = src
		if("take")
			M.take = src
		if("swap")
			M.swap = src
		if("right hand")
			M.righthand = src
		if("left hand")
			M.lefthand = src
		if("selector")
			M.selector = src

/obj/screen/drop
	name = "drop"
	icon_state = "drop"
	screen_loc = "1,1"

/obj/screen/take
	name = "take"
	icon_state = "take"
	screen_loc = "2,1"

/obj/screen/swap
	name = "swap"
	icon_state = "swap"
	screen_loc = "4,1"

/obj/screen/righthand
	name = "right hand"
	icon_state = "righthand"
	screen_loc = "5,1"

/obj/screen/lefthand
	name = "left hand"
	icon_state = "lefthand"
	screen_loc = "6,1"

/obj/screen/selector
	name = "selector"
	icon_state = "selector"
	screen_loc = "5,1"
	mouse_opacity = 0

/obj/screen/inventory
	var/slot_flag = 0

/obj/screen/inventory/Click()
	var/mob/human/H = usr
	H.interact(src)


/obj/screen/inventory/attackby(obj/item/clothing/W, mob/human/user)
	//var/success = 0
	var/slot = null
	switch(src.name)
		if("head")
			if(W.slot_flags & SLOT_HEAD && !user.head)
				slot = "head"
		if("uniform")
			if(W.slot_flags & SLOT_ICLOTHING && !user.uniform)
				slot = "uniform"
		if("shoes")
			if(W.slot_flags & SLOT_FEET && !user.shoes)
				slot = "shoes"
	if(slot)
		owner.equip_to_slot(W,slot)
	/*
	if(success)
		W.screen_loc = src.screen_loc
		W.layer = UI_LAYER + 1
		owner.update_icon()
	*/

/obj/screen/inventory/head
	name = "head"
	icon_state = "head"
	screen_loc = "13,3"

/*
/obj/screen/inventory/head/attackby(obj/item/W, mob/user)
	if(istype(W,/obj/item/clothing/head) && !(owner.head))
		owner.getridof(W)
		W.inv_slot = "head"
		owner.head = W
		owner.head.screen_loc = "13,3"
		owner.head.layer = UI_LAYER + 1
		owner.update_icon()
*/
/obj/screen/inventory/uniform
	name = "uniform"
	icon_state = "uniform"
	screen_loc = "13,2"

/*
/obj/screen/inventory/uniform/attackby(obj/item/W, mob/user)
	if(istype(W,/obj/item/clothing/uniform) && !(owner.uniform))
		owner.getridof(W)
		W.inv_slot = "uniform"
		owner.uniform = W
		owner.uniform.screen_loc = "13,2"
		owner.uniform.layer = UI_LAYER + 1
		owner.update_icon()
*/
/obj/screen/inventory/shoes
	name = "shoes"
	icon_state = "shoes"
	screen_loc = "13,1"

/*
/obj/screen/inventory/shoes/attackby(obj/item/W, mob/user)
	if(istype(W,/obj/item/clothing/shoes) && !(owner.shoes))
		owner.getridof(W)
		W.inv_slot = "shoes"
		owner.shoes = W
		owner.shoes.screen_loc = "13,1"
		owner.shoes.layer = UI_LAYER + 1
		owner.update_icon()
*/
/obj/screen/take/Click()
	for (var/obj/item/G in view(1,owner))
		if(!istype(G.loc, /turf)) continue
		owner.pickup(G)

/obj/screen/drop/Click()
	owner.drop()

/obj/screen/swap/Click()
	if(owner.hand)
		owner.selector.screen_loc = "6,1"
		owner.hand = 0
	else
		owner.selector.screen_loc = "5,1"
		owner.hand = 1

obj/screen/examine()
	return