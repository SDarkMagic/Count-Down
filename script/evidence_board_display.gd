extends Control

# @onready var node = $MadLib
var has_won: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GlobalSignals.connect('find_evidence', evidence_found)

func evidence_found(evidence_key: StringName, is_good_evidence: bool) -> void:
	var nodes: Array[Node] = find_children('*', 'EvidenceCard')
	for node: EvidenceCard in nodes:
		print(node.evidence_key,';',evidence_key)
		if node.evidence_key == evidence_key:
			if is_good_evidence:
				node.add_theme_color_override('font_color', node.positive_evidence_color)
			else:
				node.add_theme_color_override('font_color', node.negative_evidence_color)
				node.is_known_bad_evidence = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if check_has_won():
		GlobalSignals.emit_signal('win_game')
	#print(has_won)

func check_has_won() -> bool:
	var madlibs: Array[Node] = find_children('*', 'MadLib')
	var correct_fields: int = 0
	for node in madlibs:
		if node is not MadLib:
			continue
		if node.is_correct:
			correct_fields += 1
			
	if correct_fields >= len(madlibs):
		return true
	else:
		return false
		
