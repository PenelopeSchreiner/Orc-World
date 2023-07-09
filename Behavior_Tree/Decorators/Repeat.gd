extends Task

class_name Repeat

# num times to run or zero for infinite
@export var Limit := 5

var count := 0
var repeating := false

func run():
	if not repeating:
		repeating = true
		get_child(0).run()
		print("repeat run child")
	running()
	#print("run repeat")

func child_running():
	#get_child(0).run()
	print("repeat child running")
	status = States.RUNNING

func child_success():
	print("repeat child success")
	if Limit > 0:
		count += 1
		if count >= Limit:
			count = 0
			repeating = false
			success()
	
	if repeating:
		get_child(0).run()

func child_fail():
	repeating = false
	fail()
