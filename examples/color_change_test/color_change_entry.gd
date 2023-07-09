extends Task

# check if counter has elapsed, change sprite color if so


func _ready():
	tree = self
	start()
	status = States.RUNNING
	
	#get_child(0).run()

func child_running():
	status = States.RUNNING

func child_success():
	# change color?
	get_node(".").set_modulate(Color8(randi_range(0, 255), randi_range(0, 255), randi_range(0, 255),255))


func _process(delta):
	get_child(0).run()
