class_name LevelManager
extends Node3D

@export var time_limit: int = 120 # Level's time limit in minutes(seconds)
@onready var minutes_remaining: int = time_limit

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GlobalSignals.connect('decrease_time_limit', decrease_time_limt)
	GlobalSignals.connect('win_game', win)
	$Timer.start(1.0)

func decrease_time_limt(delta: int) -> void:
	minutes_remaining -= delta

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	GlobalSignals.emit_signal('update_clock', minutes_remaining, time_limit)
	if minutes_remaining <= 0:
		game_over()

func game_over() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	get_tree().paused = true
	GlobalSignals.emit_signal('hide_overlays')
	$CanvasLayer/Win.hide()
	$CanvasLayer.show()
	$CanvasLayer/GameOver.show()

func win() -> void:
	get_tree().paused = true
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	GlobalSignals.emit_signal('hide_overlays')
	$CanvasLayer/GameOver.hide()
	$CanvasLayer/Win.show()
	$CanvasLayer.show()

func _on_timer_timeout() -> void:
	minutes_remaining -= 1
	print(minutes_remaining)


func _on_restart_button_pressed() -> void:
	GlobalSignals.reload_scene()
