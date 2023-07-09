extends Task

class_name IsNeedLow

@export var need_type : Actor.Needs
@export var low_threshold : float


func run():
	#print("run is need low: " + Actor.Needs.keys()[need_type])
	# -- change this to be able to use percent of current hp or a specific value
	
	if need_type == Actor.Needs.Health:
		if tree.actor.statsObj.health_cur <= low_threshold:
			success()
			#print("health was too low")
			return
	elif need_type == Actor.Needs.Hunger:
		if tree.actor.statsObj.hunger_cur <= low_threshold:
			success()
			#print("hunger was too low")
			return
	elif need_type == Actor.Needs.Thirst:
		if tree.actor.statsObj.thirst_cur <= low_threshold:
			success()
			#print("thirst was too low")
			return
	elif need_type == Actor.Needs.Joy:
		if tree.actor.statsObj.joy_cur <= low_threshold:
			success()
			#print("joy was too low")
			return
	
	
	#print("nothing too low fail: " + name)
	fail()
