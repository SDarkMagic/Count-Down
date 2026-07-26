extends Node

signal decrease_time_limit(delta: int)
signal update_clock(time_remaining: int, time_limit: int)
signal hide_clock()
signal show_clock()
signal hide_overlays()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
