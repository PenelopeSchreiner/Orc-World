extends Task

class_name PrintMessage

@export var message := ""

func run():
	print(message)
	success()
