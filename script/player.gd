extends CharacterBody3D


const JUMP_VELOCITY = 4.5
const SENSITIVITY = 0.02

# view-bob variables
const BOB_FREQ: float = 2.0
const BOB_AMP: float = 0.008
var t_bob: float = 0.0

# fov variables
@export var base_fov: float = 110.0
@onready var current_fov: float = base_fov
var fov_change: float = 1.5

# speed variables
@export var walk_speed: float = 5.0
@export var sprint_speed: float = 10.0


@onready var head: Node3D = $Head
@onready var camera: Camera3D = $Head/Camera3D
@onready var in_evidence: bool = false

func _ready() -> void:
	camera.fov = base_fov
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	%InteractShapecast3D.add_exception($".")

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and not in_evidence:
		head.rotate_y(-event.relative.x * SENSITIVITY)
		camera.rotate_x(-event.relative.y * SENSITIVITY)
		camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-40), deg_to_rad(40))

func _process(delta: float) -> void:
	if Input.is_action_just_pressed('open_evidence'):
		if in_evidence:
			%EvidenceBoard.hide()
			current_fov = base_fov
			in_evidence = false
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
		else:
			%EvidenceBoard.show()
			current_fov = 75.0
			in_evidence = true
			Input.mouse_mode = Input.MOUSE_MODE_CONFINED
		
	var interactable: InteractableComponent = get_interactable_component_at_shapecast()
	if interactable and not in_evidence:
		interactable.hover_cursor(self)
		if Input.is_action_just_pressed('interact'):
			interactable.interact_with()

func _physics_process(delta: float) -> void:
	var speed: float
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_pressed("sprint"):
		speed = sprint_speed
	else:
		speed = walk_speed

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("move_left", "move_right", "move_forward", "move_back")
	var direction := (head.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.z = move_toward(velocity.z, 0, speed)

	# View-bob
	t_bob += delta * velocity.length() * float(is_on_floor())
	camera.transform.origin = _headbob(t_bob)
	
	# FOV
	var velocity_clamped: float = clamp(velocity.length(), 0.5, sprint_speed * 2)
	var target_fov: float = current_fov + fov_change * velocity_clamped
	camera.fov = lerp(camera.fov, target_fov, delta * 8.0)

	move_and_slide()
	
func _headbob(time: float) -> Vector3:
	var pos: Vector3 = Vector3.ZERO
	pos.y = sin(time * BOB_FREQ) * BOB_AMP
	pos.x = cos(time * BOB_FREQ / 2) * BOB_AMP
	return pos

func get_interactable_component_at_shapecast() -> InteractableComponent:
	for i in %InteractShapecast3D.get_collision_count():
		if i > 0 and %InteractShapecast3D.get_collider(0) != $'.':
			return null
		var object = %InteractShapecast3D.get_collider(i).get_node_or_null("InteractableComponent")
		if object is InteractableComponent:
			return object
	return null
		
