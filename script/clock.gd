extends Control


var initial_rotation: float = -220.0
@onready var face: TextureRect = $ClockFace

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GlobalSignals.connect('update_clock', update_clock_rotation)
	GlobalSignals.connect('hide_clock', hide)
	GlobalSignals.connect('show_clock', show)
	face.rotation_degrees = initial_rotation

func update_clock_rotation(time_remaing: int, time_limit: int) -> void:
	var target_rotation: float = (initial_rotation * time_remaing) / time_limit
	face.rotation_degrees = target_rotation

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
