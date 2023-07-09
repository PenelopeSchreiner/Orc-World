extends Task

class_name Counter

var count := 0
@export var Limit := 50

func run():
	
	if status == States.RUNNING:
		count += 1
		if count >= Limit:
			count = 0
			success()
	
	running()
