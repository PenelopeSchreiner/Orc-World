extends Node2D

# -- Signal
signal tick

# -- Onreadys
@onready var actorHolder = $Actors
@onready var testSetup = $TestSetup
@onready var tickTimer = $"Tick Timer"

# -- UI
@onready var needs_ui = $CanvasLayer/Needs

# -- Vars
var actors := []

var tps := 20
var tickrate := 0.0


# Called when the node enters the scene tree for the first time.
func _ready():
	setUpTest()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	if Input.is_action_just_pressed("start_test"):
		tickTimer.start()
	pass


func setUpTest():
	
	# -- ticks
	# 20/s = 1 second/20
	tickrate = 1.0/20.0 # 0.05
	# every 'tickrate' seconds goes by, send a tick signal
	tickTimer.wait_time = tickrate
	#tickTimer.start()
	
	testSetup.setUp()
	needs_ui.setUp(self)

func add_actor(obj):
	actorHolder.add_child(obj)
	actors.append(obj)
	
	obj.setUp(self)


func _on_tick_timer_timeout():
	emit_signal("tick", tickrate)
