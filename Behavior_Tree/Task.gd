extends Node

class_name Task

# States
enum States {
	FRESH,
	RUNNING,
	FAILED,
	SUCCEEDED,
	CANCELLED
}

var control = null
var tree = null
var guard = null
var status = States.FRESH

# Final methods (from Java meaning, "don't change it")
func running():
	status = States.RUNNING
	if control != null:
		control.child_running()

func success():
	status = States.SUCCEEDED
	if control != null:
		control.child_success()

func fail():
	status = States.FAILED
	if control != null:
		control.child_fail()

func cancel():
	if status == States.RUNNING:
		status = States.CANCELLED
		for child in get_children():
			child.child_cancel()

# Abstract methods (From Java meaning, "put your own spin on it")
func run():
	# Process the task and call running(), success(), or fail()
	pass

func child_success():
	pass

func child_fail():
	pass

func child_running():
	pass

# Non-final non-abstract methods
func start():
	print("- starting node: " + name)
	status = States.FRESH
	for child in get_children():
		child.control = self
		child.tree = self.tree
		child.start()

func reset():
	cancel()
	status = States.FRESH
