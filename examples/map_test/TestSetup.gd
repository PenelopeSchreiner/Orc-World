extends Node

@onready var world = $".."

var orcActor = preload("res://Prefabs/Actor/orc.tscn")

@export var spawnAmt = 1


# Called when the node enters the scene tree for the first time.
func setUp():
	
	for i in spawnAmt:
		var orc = orcActor.instantiate()
		world.add_actor(orc)
		#orc.position = Vector2(150, 100)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
