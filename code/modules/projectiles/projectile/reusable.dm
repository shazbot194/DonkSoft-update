/obj/item/projectile/bullet/reusable
	name = "reusable bullet"
	desc = "How do you even reuse a bullet?"
	var/ammo_type = /obj/item/ammo_casing/caseless/
	var/dropped = 0

/obj/item/projectile/bullet/reusable/on_hit(atom/target, blocked = 0)
	. = ..()
	handle_drop()

/obj/item/projectile/bullet/reusable/on_range()
	handle_drop()
	..()

/obj/item/projectile/bullet/reusable/proc/handle_drop()
	if(!dropped)
		new ammo_type(loc)
		dropped = 1

/obj/item/projectile/bullet/reusable/magspear
	name = "magnetic spear"
	desc = "WHITE WHALE, HOLY GRAIL"
	damage = 30 //takes 3 spears to kill a mega carp, one to kill a normal carp
	icon_state = "magspear"
	ammo_type = /obj/item/ammo_casing/caseless/magspear

/obj/item/projectile/bullet/reusable/foam_dart
	name = "foam dart"
	desc = "I hope you're wearing eye protection."
	damage = 0 // It's a damn toy.
	damage_type = OXY
	nodamage = 1
	icon = 'icons/obj/guns/toy.dmi'
	icon_state = "foamdart"
	ammo_type = /obj/item/ammo_casing/caseless/foam_dart
	range = 10
	var/obj/item/weapon/pen/pen = null
	edge = 0
	embed = 0

/obj/item/projectile/bullet/reusable/foam_dart/handle_drop()
	if(dropped)
		return
	dropped = 1
	var/obj/item/ammo_casing/caseless/foam_dart/newdart = new ammo_type(loc)
	var/obj/item/ammo_casing/caseless/foam_dart/old_dart = ammo_casing
	newdart.modified = old_dart.modified
	if(pen)
		var/obj/item/projectile/bullet/reusable/foam_dart/newdart_FD = newdart.BB
		newdart_FD.pen = pen
		pen.loc = newdart_FD
		pen = null
	newdart.BB.damage = damage
	newdart.BB.nodamage = nodamage
	newdart.BB.damage_type = damage_type
	newdart.update_icon()

/obj/item/projectile/bullet/reusable/foam_dart/Destroy()
	pen = null
	return ..()

/obj/item/projectile/bullet/reusable/foam_dart/riot
	name = "riot foam dart"
	icon_state = "foamdart_riot"
	ammo_type = /obj/item/ammo_casing/caseless/foam_dart/riot
	stamina = 25

/obj/item/projectile/bullet/reusable/foam_dart/riot/blue
	icon_state = "foamdart_blue"
	ammo_type = /obj/item/ammo_casing/caseless/foam_dart/riot/blue

/obj/item/projectile/bullet/reusable/foam_dart/riot/orange
	icon_state = "foamdart_orange"
	ammo_type = /obj/item/ammo_casing/caseless/foam_dart/riot/orange

/obj/item/projectile/bullet/reusable/foam_dart/riot/green
	icon_state = "foamdart_green"
	ammo_type = /obj/item/ammo_casing/caseless/foam_dart/riot/green

/obj/item/projectile/bullet/reusable/foam_dart/handle_drop()
	if(dropped)
		return

//kinda cheating but lets see how it goes
/obj/item/projectile/bullet/reusable/metalfoam
	name = "metal foam grenade"
	desc = "BREACH."
	damage = 0
	damage_type = OXY
	nodamage = 1
	icon = 'icons/obj/grenade.dmi'
	icon_state = "chemg_primed"
	ammo_type = /obj/item/weapon/grenade/chem_grenade/metalfoam/no
	range = 10
	edge = 0
	embed = 0
	var/det_time = 1


/obj/item/projectile/bullet/reusable/metalfoam/handle_drop()
	if(!dropped)
		var/obj/item/weapon/grenade/chem_grenade/metalfoam/no/F = new ammo_type(loc)
		dropped = 1
		spawn(det_time)
			F.prime()

/obj/item/projectile/bullet/reusable/tear
	name = "tear gas grenade"
	desc = "GET DOWN."
	damage = 0
	damage_type = OXY
	nodamage = 1
	icon = 'icons/obj/grenade.dmi'
	icon_state = "chemg_primed"
	ammo_type = /obj/item/weapon/grenade/chem_grenade/teargas
	range = 10
	edge = 0
	embed = 0
	var/det_time = 1


/obj/item/projectile/bullet/reusable/tear/handle_drop()
	if(!dropped)
		var/obj/item/weapon/grenade/chem_grenade/teargas/F = new ammo_type(loc)
		dropped = 1
		spawn(det_time)
			F.prime()

<<<<<<< HEAD

/obj/item/projectile/bullet/reusable/rifle_foam
	name = "rifle foam dart"
	icon = 'icons/obj/guns/toy.dmi'
	icon_state = "riflefoam_red"
	ammo_type = /obj/item/ammo_casing/caseless/rifle_foam
	range = 15
	damage = 0
	stamina = 50
	damage_type = OXY
	nodamage = 1
	edge = 0
	embed = 0

/obj/item/projectile/bullet/reusable/foam_dart/handle_drop()
	if(dropped)
		return
	dropped = 1
	var/obj/item/ammo_casing/caseless/rifle_foam/newdart = new ammo_type(loc)
	newdart.update_icon()
=======
/obj/item/projectile/bullet/reusable/smoke
	name = "smoke grenade"
	desc = "GET DOWN."
	damage = 0
	damage_type = OXY
	nodamage = 1
	icon = 'icons/obj/grenade.dmi'
	icon_state = "flashbang_active"
	ammo_type = /obj/item/weapon/grenade/smokebomb
	range = 10
	edge = 0
	embed = 0
	var/det_time = 10


/obj/item/projectile/bullet/reusable/smoke/handle_drop()
	if(!dropped)
		var/obj/item/weapon/grenade/smokebomb/F = new ammo_type(loc)
		dropped = 1
		spawn(det_time)
			F.prime()
>>>>>>> origin/master
