extends Resource

class_name Comm

enum CommType {
	Hungry,
	Thirsty,
	Sad,
	Hurt
}

@export var type : CommType

@export var comm_tex : Texture
