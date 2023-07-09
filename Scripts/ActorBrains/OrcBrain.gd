extends Task

@onready var actor = $".."

# Called when the node enters the scene tree for the first time.
func _ready():
	tree = self
	start()
	status = States.RUNNING


func tick_tree():
	if status == States.RUNNING:
		if get_child_count() > 0:
			get_child(0).run()


func child_running():
	status = States.RUNNING
	#print("-tree running")

func child_success():
	status = States.SUCCEEDED
	#print("tree succeeded?")

func child_fail():
	status = States.FAILED
	#print("tree failed?")
