extends EvidenceItem


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var mat: Material = $herring/Sphere_002.get_active_material(0)
	if $InteractableComponent.get_character_hovered_by_current_camera() is CharacterBody3D and $InteractableComponent.can_interact:
		mat.next_pass = outline_shader
	else:
		mat.next_pass = null


func _on_interactable_component_interacted() -> void:
	$DialogueBox.begin_linear_dialogue()
	$InteractableComponent.can_interact = false
