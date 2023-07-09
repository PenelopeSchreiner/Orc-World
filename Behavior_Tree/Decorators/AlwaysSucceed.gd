extends Task

class_name AlwaysSucceed

func run():
	if get_child_count() > 0:
		get_child(0).run()
	success()

# ignore child success
func child_success():
	pass

# ignore child failure
func child_fail():
	pass
