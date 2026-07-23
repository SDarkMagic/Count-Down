class_name LevelManager
extends Node3D

@export var time_limit: int = 120 # Level's time limit in minutes
@onready var minutes_remaining: int = time_limit

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
