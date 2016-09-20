obj/machinery/budgetdisplay
	name = "budget display"
	desc = "It displays the outpost's budget."
	icon_state = "budget_profit"

obj/machinery/budgetdisplay/examine(user)
	..()
	if(money <= 0)
		user << "The outpost is running a deficit of [money*-1] dollars."
	else
		user << "The outpost budget is [money] dollars."

obj/machinery/budgetdisplay/process()
	if(money <= 0)
		icon_state = "budget_loss"
	else
		icon_state = "budget_profit"

obj/machinery/buy
	name = "buy"
	desc = "Buy low."
	icon_state = "buy"

obj/machinery/buy/attack_hand(user)
	user << "You buy some stocks."
	money = money - 50

obj/machinery/sell
	name = "sell"
	desc = "Sell high."
	icon_state = "sell"

obj/machinery/sell/attack_hand(user)
	user << "You sell some stocks."
	money = money + 50