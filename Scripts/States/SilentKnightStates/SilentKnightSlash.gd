extends SilentKnight_States

class_name SilentKnightSlash

func Enter():
	slash = true
	attackAnimations("slash_animation")
	
	enemy = get_tree().get_first_node_in_group("MiniBosses")
	
	player_enemy_Distance = player.global_position - enemy.global_position
	
func Update(delta : float):
	pass

func PhysicsUpdate(delta : float):
	if player:
		pass
	
	attackStates()
	moveStates()
	
