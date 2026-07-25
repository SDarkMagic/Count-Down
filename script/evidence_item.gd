class_name EvidenceItem
extends StaticBody3D

@export var model_node_path: String
@export var interactable_component: InteractableComponent
@export var materials_to_outline: Array[int]
@export var dialogue_box: DialogueBox
@export var evidence_board_key: StringName
@onready var outline_shader = preload("res://mdl/mtrl/outline.tres")
@onready var model_node: MeshInstance3D = get_node(model_node_path)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if interactable_component.get_character_hovered_by_current_camera() is CharacterBody3D and interactable_component.can_interact:
		for mat_id in materials_to_outline:
			var mat: Material = model_node.get_active_material(mat_id)
			mat.next_pass = outline_shader
	else:
		for mat_id in materials_to_outline:
			var mat: Material = model_node.get_active_material(mat_id)
			mat.next_pass = null
		

func _on_interactable_component_interacted() -> void:
	dialogue_box.begin_linear_dialogue()
	interactable_component.can_interact = false
