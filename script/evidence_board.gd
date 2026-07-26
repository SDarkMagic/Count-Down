extends Node3D

var is_dragging: bool = false
var drag_plane: Plane = Plane(Plane.PLANE_YZ)
var origin: Vector3
var evidence_origins: Dictionary = {}
@export var open_sound: AudioStream
@export var close_sound: AudioStream

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	origin = position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func play_open_sound() -> void:
	$AudioStreamPlayer3D.stream = open_sound
	$AudioStreamPlayer3D.play()
	
func play_close_sound() -> void:
	$AudioStreamPlayer3D.stream = close_sound
	$AudioStreamPlayer3D.play()
	
