extends Actor

class_name OrcActor


signal update_needs_ui


# -- Vars
var target
@onready var comm_bub = $"CanvasLayer/Comm Bubble"

# everything that this actor wants to communicate right now
# make Comm class to know when to get rid of specific comms (ex: no longer hungry, so clear hunger icon from comm_list
var comm_list := []
var cur_comm_idx := 0
var cur_time := 0.0
var comm_delay := 1

# var cur_job - later


func _ready():
	statsObj = $Stats
	brainStem = $"Behavior Tree"

func _progress(delta):
	pass
	#if comm_list.size() > 0:
	#	cur_time += delta


func setUp(world):
	# connect to tick signal
	world.tick.connect(tick)


func tick(_tickrate):
	
	# -- display anything in comm_list
	if comm_list.size() > 0:
		set_comm(comm_list[cur_comm_idx].comm_tex)
		show_comm_bub()
		
		cur_time += _tickrate
		
		if cur_time >= comm_delay:
			cur_time = 0.0 
			cur_comm_idx += 1
			if cur_comm_idx > comm_list.size() - 1:
				cur_comm_idx = 0
	else:
		hide_comm_bub()
	
	# - decrease needs over time
	var hp_change := false
	var hunger_change := false
	var thirst_change := false
	var joy_change := false
	
	if statsObj.hunger_cur > 0.0:
		statsObj.hunger_cur -= statsObj.hunger_rate
		hunger_change = true
	if statsObj.thirst_cur > 0.0:
		statsObj.thirst_cur -= statsObj.thirst_rate
		thirst_change = true
	if statsObj.joy_cur > 0.0:
		statsObj.joy_cur -= statsObj.dejoy_rate
		joy_change = true
	
	if hp_change == true or hunger_change == true or thirst_change == true or joy_change == true:
		update_needs_ui.emit(self)
	
	# tick tree
	brainStem.tick_tree()


# -- for comm bubbles, need a list of all current things to show and alternate between them
func add_comm(_comm):
	# check comm_list to make sure this comm isn't already in the list
	for c in comm_list:
		if c.type == _comm.type:
			push_warning("this actor has this comm type already: " + Comm.CommType.keys()[_comm.type])
			return
	
	comm_list.append(_comm)
	print(comm_list)

func show_comm_bub():
	#print("-- show comm bub")
	comm_bub.show()

func hide_comm_bub():
	comm_bub.hide()

# -- set what to display in the comm bubble
func set_comm(tex):
	comm_bub.update_texture(tex)
