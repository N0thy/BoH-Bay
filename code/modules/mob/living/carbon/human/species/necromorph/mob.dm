/*
	Code for the necromorph mob.
	Most of this is a temporary hack because we don't have proper icons for parts.

`	I am well aware this is not how human mobs and species are supposed to be used
*/
/mob/living/carbon/human/necromorph


/*
	Slasher Mob setup
*/
/mob/living/carbon/human/necromorph/slasher/New(var/new_loc, var/new_species = SPECIES_NECROMORPH_SLASHER)
	..(new_loc, new_species)

/mob/living/carbon/human/necromorph/slasher_enhanced/New(var/new_loc, var/new_species = SPECIES_NECROMORPH_SLASHER_ENHANCED)
	..(new_loc, new_species)

//A dummy version of slasher for target practise
/mob/living/carbon/human/necromorph/slasher/dummy
	status_flags = GODMODE|CANPUSH
	virtual_mob = null

/mob/living/carbon/human/necromorph/slasher/dummy/Initialize()
	. = ..()
	STOP_PROCESSING(SSmobs, src)

#define DEBUG
//Override all that complicated limb-displaying stuff, with singular icons
/mob/living/carbon/human/necromorph/update_body(var/update_icons=1)
	var/datum/species/necromorph/N = species


	if (!istype(N))
		return

	//If single icon is turned off, do the normal thing
	if (!N.single_icon)
		return ..()

	stand_icon = N.icon_template
	icon = stand_icon

	if (stat == DEAD)
		icon_state = N.icon_dead

	else if (lying)
		icon_state = N.icon_lying
	else
		icon_state = N.icon_normal



//Generic proc to see if a thing is aligned with the necromorph faction
/datum/proc/is_necromorph()
	return FALSE


/mob/living/carbon/human/is_necromorph()
	if (istype(species, /datum/species/necromorph))
		return TRUE
	return FALSE




/mob/Login()
	.=..()
	//Update the necromorph players list
	if (is_necromorph())
		set_necromorph(TRUE)