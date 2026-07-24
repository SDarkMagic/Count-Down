class_name EvidenceCard
extends Button



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	return
	#%Label.text = text


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _get_drag_data(at_position: Vector2) -> Variant:
	#print(self.text)
	return self
	
