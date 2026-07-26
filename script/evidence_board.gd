extends Node3D

var is_dragging: bool = false
var drag_plane: Plane = Plane(Plane.PLANE_YZ)
var origin: Vector3
var evidence_origins: Dictionary = {}
var is_mouse_inside_viewport: bool = false
var is_mouse_held: bool = false
var mouse_pos: Vector2
var projected_global_mouse_pos: Vector3
@export var open_sound: AudioStream
@export var close_sound: AudioStream
@onready var camera = get_viewport().get_camera_3d()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	origin = position
	
func mouse_entered() -> void:
	is_mouse_inside_viewport = true

func mouse_exited() -> void:
	is_mouse_inside_viewport = false
"""
func _input(event: InputEvent) -> void:
	# Check if it's a mouse event we need to forward
	var is_mouse_event := event is InputEventMouseButton or event is InputEventMouseMotion
	if not is_mouse_event:
		return
	forward_input(event)
		
func forward_input(event: InputEvent) -> void:
	if not (event is InputEventMouseButton or event is InputEventMouseMotion):
		return

	var local_pos_3d: Vector3 = $Sprite3D.to_local(projected_global_mouse_pos)
	var viewport_size: Vector2 = $SubViewport.size
	
	viewport_size.x *= $Sprite3D.scale.x
	viewport_size.y *= $Sprite3D.scale.y
	
	var local_pos_2d := Vector2(
		local_pos_3d.x / $Sprite3D.pixel_size,
		-local_pos_3d.y / $Sprite3D.pixel_size
	)
	local_pos_2d.x += viewport_size.x / 2.0
	local_pos_2d.y += viewport_size.y / 2.0
	
	local_pos_2d.x *=  $Sprite3D.scale.x
	local_pos_2d.y *= $Sprite3D.scale.y
	
	print(local_pos_2d)
	
	var duplicated_event: InputEvent = event.duplicate()
	duplicated_event.position = local_pos_2d
	if duplicated_event is InputEventMouseMotion:
		duplicated_event.global_position = local_pos_2d
	
	# Track continuous click retention state
	if event is InputEventMouseButton:
		is_mouse_held = event.pressed
	$SubViewport.push_input(duplicated_event)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_mouse_inside_viewport:
		mouse_pos = get_viewport().get_mouse_position()
		print(mouse_pos)
		$RayCast3D.position = camera.project_ray_origin(mouse_pos)
		$RayCast3D.target_position = $RayCast3D.position + camera.project_ray_normal(mouse_pos) * 500.0
		

func _physics_process(delta: float) -> void:
	if $RayCast3D.is_colliding():
		projected_global_mouse_pos = $RayCast3D.get_collision_point()
"""		
func play_open_sound() -> void:
	$AudioStreamPlayer3D.stream = open_sound
	$AudioStreamPlayer3D.play()

func play_close_sound() -> void:
	$AudioStreamPlayer3D.stream = close_sound
	$AudioStreamPlayer3D.play()
