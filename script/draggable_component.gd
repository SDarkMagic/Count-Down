class_name DraggableComponent

signal drag_completed(data: DraggableComponent)

var souce: Control
var dest: Control

var draggable: EvidenceCard
var preview: Control

func _init(_source: Control, _draggable: EvidenceCard, _preview: Control) -> void:
	self.source = _source
	self.draggable = _draggable
	self.preview = _preview
	self.preview.tree_exiting.connect(_on_tree_exiting)

func _on_tree_exiting() -> void:
	drag_completed.emit(self)
	
