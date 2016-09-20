client
	New() // new client made
		..() //call parents
		var/mob/old = src.mob
		var/mob/controlled = new /mob/human()
		controlled.client = src
		del old
		new /obj/screen/drop(src) //new hud
		new /obj/screen/take(src)
		new /obj/screen/swap(src)
		new /obj/screen/righthand(src)
		new /obj/screen/lefthand(src)
		new /obj/screen/selector(src)
		new /obj/screen/inventory/head(src)
		new /obj/screen/inventory/uniform(src)
		new /obj/screen/inventory/shoes(src)

client
	Del()
		..()