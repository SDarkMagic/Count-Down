class_name MadLib
extends RichTextLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	if !data is EvidenceCard: return false
	var drag_data := data as EvidenceCard
	#print("candropdata")
	return true #validation will probably be here

func _drop_data(at_position: Vector2, data: Variant) -> void:
	#if !data is EvidenceCard: return
	print("drop data")
	var drag_data := data as EvidenceCard
	text = drag_data.text
	print("label: ", text)
	#print(label.text)
	


#func _on_evidence_card_is_dragged(data: EvidenceCard) -> void:
	#print("signal received")
	#var drag_data := data as EvidenceCard
	#label.text = drag_data.text
	#print("signal funct: ", text)
	#pass # Replace with function body.
