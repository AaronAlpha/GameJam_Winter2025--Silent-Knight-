extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


# the following are the signals connecting to the 4 buttons created: Start; Controls; Settings; Exit

# start button
func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Levels Scenes/starter_room_node_2d.tscn")

# exit button
func _on_exit_button_pressed() -> void:
	get_tree().quit()
