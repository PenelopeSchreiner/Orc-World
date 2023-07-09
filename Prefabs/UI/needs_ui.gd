extends PanelContainer


@onready var health_bar = $"MarginContainer/VBoxContainer/Health Need/Need Bar"
@onready var hunger_bar = $"MarginContainer/VBoxContainer/Hunger Need/Need Bar"
@onready var thirst_bar = $"MarginContainer/VBoxContainer/Thirst Need/Need Bar"
@onready var joy_bar = $"MarginContainer/VBoxContainer/Joy Need/Need Bar"


var target_actor : Actor


func setUp(world):
	# -- temp for testing
	target_actor = world.actors[0]
	
	update_bars(true)
	
	target_actor.update_needs_ui.connect(on_update_needs_ui)

func on_update_needs_ui(actor):
	target_actor = actor
	
	update_bars()


func update_bars(update_maxes : bool = false):
	if target_actor != null:
		health_bar.get_child(1).value = target_actor.statsObj.health_cur
		hunger_bar.get_child(1).value = target_actor.statsObj.hunger_cur
		thirst_bar.get_child(1).value = target_actor.statsObj.thirst_cur
		joy_bar.get_child(1).value = target_actor.statsObj.joy_cur
		if update_maxes == true:
			health_bar.get_child(1).max_value = target_actor.statsObj.health_max
			hunger_bar.get_child(1).max_value = target_actor.statsObj.hunger_max
			thirst_bar.get_child(1).max_value = target_actor.statsObj.thirst_max
			joy_bar.get_child(1).max_value = target_actor.statsObj.joy_max
