extends Task

class_name UntilSuccess

# Only reports a success

func run():
	get_child(0).run()
	running()

func child_success():
	success()

# Ignore child failure
func child_fail():
	pass
