var/global/list/ai/all_boss_ai = list()

SUBSYSTEM_DEF(bossai)
	name = "Boss AI Subsystem"
	desc = "Controls the AI of bosses."
	tick_rate = DECISECONDS_TO_TICKS(AI_TICK)
	priority = SS_ORDER_IMPORTANT
	cpu_usage_max = 100
	tick_usage_max = 100

/subsystem/bossai/on_life()

	for(var/ai/AI in all_boss_ai)
		CHECK_TICK
		if(AI && !AI.owner)
			log_error("WARING! AI of type [AI.type] didn't have an owner!")
			qdel(AI)
			continue
		if(AI.should_life())
			AI.on_life()

	return TRUE