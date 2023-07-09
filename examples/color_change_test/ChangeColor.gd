extends Task

class_name ChangeColor

@export var target : NodePath = ""

func run():
	print("run change color")
	# change color of target sprite
	get_node(target).modulate = Color8(randi_range(0, 255), randi_range(0, 255), randi_range(0, 255),255)
	success()
