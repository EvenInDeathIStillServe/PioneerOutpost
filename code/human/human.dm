mob/human
	name = "Player"
	icon = 'icons/mobs.dmi'
	icon_state = "player"

	var/obj/item/clothing/uniform = null
	var/obj/item/clothing/head = null
	var/obj/item/clothing/shoes = null

	var/obj/item/r_hand = null
	var/obj/item/l_hand = null
	hand = 1


mob/human/New()
	spawn(0)
		equip_to_slot(new/obj/item/clothing/uniform/workman(src.loc), "uniform")
		equip_to_slot(new/obj/item/clothing/head/hardhat(src.loc), "head")
		equip_to_slot(new/obj/item/clothing/shoes/rubberboots(src.loc), "shoes")
	player_list.Add(src)

mob/human/proc/equip_to_slot(var/obj/item/W as obj, var/slot)
	client.screen += W
	switch(slot)
		if("head")
			getridof(W)
			head = W
			W.inv_slot = "head"
			W.screen_loc = "13,3"
		if("shoes")
			getridof(W)
			shoes = W
			W.inv_slot = "shoes"
			W.screen_loc = "13,1"
		if("uniform")
			getridof(W)
			uniform = W
			W.inv_slot = "uniform"
			W.screen_loc = "13,2"
	W.loc = src
	W.layer = UI_LAYER + 1
	update_icon()


mob/human/update_icon()
	overlays.Cut()
	if(uniform)
		overlays += image('icons/mob/uniform.dmi', uniform.item_state)
	if(head)
		overlays += image('icons/mob/head.dmi', head.item_state)
	if(shoes)
		overlays += image('icons/mob/feet.dmi', shoes.item_state)

mob/human/interact(atom/interacted)
	if(interacted.loc == src)
		src.unequip(interacted)
		update_icon()
		return
	if(hand)
		if(r_hand)
			interacted.attackby(r_hand,src)
		else
			interacted.attack_hand(src)
	else
		if(l_hand)
			interacted.attackby(l_hand,src)
		else
			interacted.attack_hand(src)

mob/human/getridof(obj/item/riddenof)
	if(r_hand == riddenof)
		r_hand = null
	else if(l_hand == riddenof)
		l_hand = null

mob/human/unequip(obj/item/unequipped)
	if(hand && r_hand == unequipped || !hand && l_hand == unequipped)
		return
	switch(unequipped.inv_slot)
		if("r_hand")
			src.r_hand = null
		if("l_hand")
			src.l_hand = null
		if("uniform")
			src.uniform = null
		if("head")
			src.head = null
		if("shoes")
			src.shoes = null
	client.screen -= unequipped
	src.pickup(unequipped)

mob/human/pickup(obj/item/pickedup)
	client.screen += pickedup
	if(hand)
		put_in_r_hand(pickedup)
		pickedup.screen_loc = "5,1"
	else
		put_in_l_hand(pickedup)
		pickedup.screen_loc = "6,1"
	update_icon()

mob/human/drop()
	if(hand)
		drop_r_hand()
	else
		drop_l_hand()
	update_icon()

mob/human/proc/put_in_r_hand(var/obj/item/pickedup)
	if(r_hand)
		return
	pickedup.loc = src
	r_hand = pickedup
	r_hand.layer = UI_LAYER + 1
	r_hand.inv_slot = "r_hand"
	src << "You pick up [pickedup]."

mob/human/proc/put_in_l_hand(var/obj/item/pickedup)
	if(l_hand)
		return
	pickedup.loc = src
	l_hand = pickedup
	l_hand.screen_loc = "6,1"
	l_hand.layer = UI_LAYER + 1
	l_hand.inv_slot = "l_hand"
	src << "You pick up [pickedup]."

mob/human/proc/drop_r_hand()
	if(!r_hand)
		return
	r_hand.loc = src.loc
	src << "You drop [r_hand]."
	client.screen -= r_hand
	r_hand.layer = initial(r_hand.layer)
	r_hand.inv_slot = null
	r_hand = null

mob/human/proc/drop_l_hand()
	if(!l_hand)
		return
	l_hand.loc = src.loc
	src << "You drop [l_hand]."
	client.screen -= l_hand
	l_hand.layer = initial(l_hand.layer)
	l_hand.inv_slot = null
	l_hand = null