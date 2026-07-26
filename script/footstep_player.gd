extends Node3D
@export var footstep_sound_wood: AudioStream
@export var footstep_sound_tile: AudioStream
@export var tile_material_names: Array[String]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AudioStreamPlayer3D.stream = footstep_sound_wood

func play() -> void:
	$AudioStreamPlayer3D.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
