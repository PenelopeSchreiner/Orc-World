extends Task

class_name ShowCommBub

@export var comm : Comm


func run():
	tree.actor.add_comm(comm)
	#tree.actor.set_comm(comm)
	#tree.actor.show_comm_bub()
	success()
