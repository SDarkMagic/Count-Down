class_name DialogueBox
extends MarginContainer

@export_multiline var texts: Array[String]
@export var title: String
@export var is_visible: bool = false
@export var time_cost_per_line: int = 1

@onready var current_line: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$MarginContainer/Label.text = title

func begin_linear_dialogue() -> void:
	get_tree().paused = true
	$AnimationPlayer.play('show_box')

func _input(event: InputEvent) -> void:
	if event.is_action_pressed('select') and is_visible:
		show_line(current_line + 1)
		
func show_line(line_index: int) -> void:
	if line_index >= len(texts):
		$AnimationPlayer.play('hide_box')
		current_line = 0
	else:
		GlobalSignals.emit_signal('decrease_time_limit', time_cost_per_line)
		current_line = line_index
		$NinePatchRect/MarginContainer/RichTextLabel.text = texts[current_line]

func unpause_game() -> void:
	get_tree().paused = false
