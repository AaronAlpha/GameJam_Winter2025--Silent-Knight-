extends SilentKnight_States

class_name SilentKnightSlash

func Enter():
	check_death()
	
	slash = true
	attackAnimations("slash_animation")
	
	enemy = get_tree().get_first_node_in_group("MiniBosses")
	
	player_enemy_Distance = player.global_position - enemy.global_position
	
func Update(delta : float):
	pass

func PhysicsUpdate(delta : float):
	if player:
		pass
	
	if Input.is_action_just_pressed("Slash"):
		Transitioned.emit(self, "SilentKnightSlash")
	elif Input.is_action_just_pressed("Stab"):
		Transitioned.emit(self, "SilentKnightStab")
	
	if ((direction > 0 or Input.is_action_pressed("move_right")) or (direction < 0 or Input.is_action_pressed("move_left"))) and player.is_on_floor():
		print("2")
		Transitioned.emit(self, "SilentKnightMove")
	
	elif Input.is_action_just_pressed("jump") and player.is_on_floor():
		print("3")
		Transitioned.emit(self, "SilentKnightJump")
	
	elif Input.is_action_pressed("crouch") and player.is_on_floor():
		print("4")
		Transitioned.emit(self, "SilentKnightCrouch")
		
	else:
		print("5")
		Transitioned.emit(self, "SilentKnightFall")
	
