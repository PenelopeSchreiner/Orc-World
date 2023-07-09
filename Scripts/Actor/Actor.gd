extends CharacterBody2D

class_name Actor

enum Needs {
	Health,
	Hunger,
	Thirst,
	Joy
}

# -- Vars
var statsObj
var brainStem


# - change needs values, check behavior tree, take damage over time, regeneration, etc
func tick(_tickrate):
	pass
