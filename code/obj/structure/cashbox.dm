obj/structure/cashbox

obj/structure/cashbox
	name = "Deposit Box"
	desc = "Sell refined goods for money."
	icon_state = "cashbox"
	density = 1

obj/structure/cashbox/attackby(var/obj/item/W, mob/user)
	if(istype(W, /obj/item/ingot/gold))
		user << "You sell the [W]."
		money = money + 25
		del W
	if(istype(W, /obj/item/ingot/iron))
		user << "You sell the [W]."
		money = money + 10
		del W
	if(istype(W, /obj/item/gold))
		user << "You sell the [W]."
		money = money + 100
		del W
	if(istype(W, /obj/item/planks))
		user << "You sell the [W]."
		money = money + 5
		del W