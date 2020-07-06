/mob/living/simple_animal/hostile/alien
	name = "alien hunter"
	desc = "Hiss!"
	icon = 'icons/mob/alien.dmi'
	icon_state = "alienh_running"
	icon_living = "alienh_running"
	icon_dead = "alienh_dead"
	icon_gib = "syndicate_gib"
	gender = FEMALE
	response_help = "pokes"
	response_disarm = "shoves"
	response_harm = "hits"
	speed = 0
	maxHealth = 125
	health = 125
	harm_intent_damage = 5
	obj_damage = 60
	melee_damage_lower = 25
	melee_damage_upper = 25
	attacktext = "slashes"
	speak_emote = list("hisses")
	a_intent = I_HARM
	attack_sound = 'sound/weapons/bladeslice.ogg'
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	unsuitable_atmos_damage = 15
	heat_damage_per_tick = 20
	faction = list("alien")
	status_flags = CANPUSH
	minbodytemp = 0
	see_in_dark = 8
	lighting_alpha = LIGHTING_PLANE_ALPHA_MOSTLY_INVISIBLE
	death_sound = 'sound/voice/hiss6.ogg'
	deathmessage = "lets out a waning guttural screech, green blood bubbling from its maw..."

/mob/living/simple_animal/hostile/alien/maid
	name = "lusty xenomorph maid"
	melee_damage_lower = 0
	melee_damage_upper = 0
	a_intent = I_HELP
	friendly = "caresses"
	obj_damage = 0
	environment_smash = ENVIRONMENT_SMASH_NONE
	icon_state = "maid"
	icon_living = "maid"
	icon_dead = "maid_dead"

/mob/living/simple_animal/hostile/alien/maid/AttackingTarget()
	if(ismovable(A)(target))
		if(istype(target, /obj/effect/decal/cleanable))
			visible_message("<span class='notice'>\The [src] cleans up \the [target].</span>")
			qdel(target)
			return TRUE
		var/atom/movable/M = target
		M.clean_blood()
		visible_message("<span class='notice'>\The [src] polishes \the [target].</span>")
		return TRUE
