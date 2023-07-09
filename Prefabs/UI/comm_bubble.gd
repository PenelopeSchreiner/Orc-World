extends Control

@onready var comm_tex = $panel/MarginContainer/TextureRect

func update_texture(tex):
	#print(tex)
	comm_tex.texture = tex
