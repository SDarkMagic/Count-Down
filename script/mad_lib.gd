class_name MadLib
extends RichTextLabel

@export var correct_answer: StringName
var allow_drop: bool = true
var is_correct: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	if !data is EvidenceCard or !allow_drop: return false
	var drag_data := data as EvidenceCard
	if drag_data.is_known_bad_evidence:
		print('known bad evidence')
		return false
	return true #validation will probably be here

func _drop_data(at_position: Vector2, data: Variant) -> void:
	#if !data is EvidenceCard: return
	
	var drag_data: EvidenceCard = data
	text = drag_data.text
	print(drag_data.evidence_key,';',correct_answer)
	if drag_data.text == correct_answer:
		allow_drop = false
		is_correct = true


#func _on_evidence_card_is_dragged(data: EvidenceCard) -> void:
	#print("signal received")
	#var drag_data := data as EvidenceCard
	#label.text = drag_data.text
	#print("signal funct: ", text)
	#pass # Replace with function body.
