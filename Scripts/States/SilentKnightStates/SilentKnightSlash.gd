extends SilentKnight_States

class_name SilentKnightSlash

func Enter():
	$"../../CollisionShape2D".visible = true
	$"../../CollisionShape2D".disabled = false

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
	
	# attack states
	if Input.is_action_just_pressed("Slash"):
		Transitioned.emit(self, "SilentKnightSlash")
	elif Input.is_action_just_pressed("Stab"):
		Transitioned.emit(self, "SilentKnightStab")
	
	
	# move states
	if ((direction > 0 or Input.is_action_pressed("move_right")) or (direction < 0 or Input.is_action_pressed("move_left"))) and player.is_on_floor():


		Transitioned.emit(self, "SilentKnightMove")
	
	elif Input.is_action_just_pressed("jump") and player.is_on_floor():

		Transitioned.emit(self, "SilentKnightJump")
	
	elif !player.is_on_floor():

		Transitioned.emit(self, "SilentKnightFall")
	
	else:

		Transitioned.emit(self, "SilentKnightIdle")
