extends Control

# @onready var node = $MadLib

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GlobalSignals.connect('find_evidence', evidence_found)

func evidence_found(evidence_key: StringName, is_good_evidence: bool) -> void:
	var nodes: Array[Node] = find_children('*', 'EvidenceCard')
	for node: EvidenceCard in nodes:
		if node.evidence_key == evidence_key:
			if is_good_evidence:
				node.add_theme_color_override('font_color', node.positive_evidence_color)
			else:
				node.add_theme_color_override('font_color', node.negative_evidence_color)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
