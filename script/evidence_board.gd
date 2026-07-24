extends Node3D

var is_dragging: bool = false
var drag_plane: Plane = Plane(Plane.PLANE_YZ)
var origin: Vector3
var evidence_origins: Dictionary = {}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	origin = position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
# test push
