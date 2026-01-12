extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



# a signal will detect some "thing" in the game
# thing - meant to be some action performed in-game and do something afterwards as a result

# give button fucntionality
# we want signal to detect the button action of being pressed
func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Levels Scenes/starter_room_node_2d.tscn")
