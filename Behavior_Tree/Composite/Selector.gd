extends Task

class_name Selector

# One of the children must run successfully

var current_child = 0

func run():
	get_child(current_child).run()
	running()
	#print("running selector: " + name)

func child_running():
	#print("selector child running")
	status = States.RUNNING
	pass

func child_success():
	current_child = 0
	success()
	#print("selector child success")

func child_fail():
	current_child += 1
	if current_child >= get_child_count():
		current_child = 0
		fail()
	#print("selector child fail")

func cancel():
	current_child = 0
	super.cancel()

func start():
	current_child = 0
	super.start()
