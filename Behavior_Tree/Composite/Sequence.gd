extends Task

class_name Sequence

# all children must run successfully

var current_child = 0

func run():
	get_child(current_child).run()
	running()
	#print("run sequence: " + name)

func child_running():
	status = States.RUNNING
	#print("sequence running: " + name)

func child_success():
	#print("sequence child success: " + name)
	current_child += 1
	if current_child >= get_child_count():
		current_child = 0
		success()

func child_fail():
	#print("sequence child fail: " + name)
	current_child = 0
	fail()
