class_name InteractableComponent
extends Node

@export var can_interact: bool = true

var characters_hovering: Dictionary = {}

signal interacted()

func interact_with() -> void:
	if not can_interact:
		return
	interacted.emit()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	for character in characters_hovering.keys():
		if Engine.get_process_frames() - characters_hovering[character] > 1:
			characters_hovering.erase(character)

func hover_cursor(character: CharacterBody3D) -> void:
	characters_hovering[character] = Engine.get_process_frames() # Store the frame number with the character that the hover occurred on
	
func get_character_hovered_by_current_camera() -> CharacterBody3D:
	for character in characters_hovering.keys():
		var current_cam = get_viewport().get_camera_3d() if get_viewport() else null
		if current_cam in character.find_children('*', 'Camera3D'):
			return character
	return null
			
