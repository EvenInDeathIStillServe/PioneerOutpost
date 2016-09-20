obj/item
	icon = 'icons/items.dmi'
	var/inv_slot = null
	var/slot_flags = 0

obj/item/gold
	name = "bag of gold"
	desc = "We're rich!"
	icon_state = "gold"

obj/item/attack_hand(mob/user)
	user.pickup(src)

/obj/item/verb/verb_pickup()
	set name = "Pick up"
	set category = "Object"
	set src in oview(1)

	usr.interact(src)