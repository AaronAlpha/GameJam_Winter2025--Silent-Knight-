extends SilentKnight_States

class_name SilentKnightDeath


func Enter():
	$"../../CollisionShape2D".visible = true
	$"../../CollisionShape2D".disabled = false

	
	
	# depending on dir
	# we switch on the left or right death animation
	attackAnimations("death_animation")

func Update(delta : float):
	get_tree().change_scene_to_file("res://Scenes/UI Scenes/MainMenu_Control.tscn")

func PhysicsUpdate(delta : float):
	# changing the visiblity of the player - signaling its death
	if player.visible:
		player.visible = false
