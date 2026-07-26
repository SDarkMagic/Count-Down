extends Node

signal decrease_time_limit(delta: int)
signal update_clock(time_remaining: int, time_limit: int)
signal hide_clock()
signal show_clock()
signal hide_overlays()

func reload_scene():
	var tree = get_tree()
	if tree != null:
		tree.reload_current_scene()
		tree.paused = false
	else:
		print("Tree was null")

func load_scene(scene: PackedScene) -> void:
	var tree = get_tree()
	if tree == null:
		print("Tree was null")
		return
	tree.change_scene_to_packed(scene)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
