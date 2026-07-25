class_name EvidenceCard
extends Button
signal is_dragged(EvidenceCard)

@export var evidence_key: StringName
@export var positive_evidence_color: Color
@export var negative_evidence_color: Color

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#%Label.text = text
	return

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# set nodes position to be mouse position? 
	#position = get_viewport().get_mouse_position()
	#print(get_viewport().get_mouse_position())
	pass

func _get_drag_data(at_position: Vector2) -> Variant:
	#print(self.text)
	is_dragged.emit(self)
	print(at_position)
	#set_drag_preview(self)
	return self
	
func _on_evidence_card_is_dragged(data: EvidenceCard) -> void:
	print("signal received")
	
	#var drag_data := data as EvidenceCard
	#label.text = drag_data.text
	#print("signal funct: ", text)
	pass # Replace with function body.
