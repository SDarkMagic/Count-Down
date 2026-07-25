class_name LevelManager
extends Node3D

@export var time_limit: int = 120 # Level's time limit in minutes(seconds)
@onready var minutes_remaining: int = time_limit

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GlobalSignals.connect('decrease_time_limit', decrease_time_limt)

func decrease_time_limt(delta: int) -> void:
	minutes_remaining -= delta

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if minutes_remaining <= 0:
		print('Time up')


func _on_timer_timeout() -> void:
	minutes_remaining -= 1
