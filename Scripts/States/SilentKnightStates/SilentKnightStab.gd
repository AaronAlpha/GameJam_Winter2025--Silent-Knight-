extends SilentKnight_States

class_name SilentKnightStab

# slash is E; stab is Q

func Enter():
	check_death()

	$"../../AnimatedSprite2D".stop()
	$"../../AnimatedSprite2D".visible = false


	if direction > 0 or Input.is_action_pressed("move_right"): # moving right
	
		$"../../L_Attack_AnimatedSprite2D".visible = true
		$"../../L_Attack_AnimatedSprite2D".play("stab_animation")
	
	elif direction < 0 or Input.is_action_pressed("move_left"): # moving left

		$"../../R_Attack_AnimatedSprite2D".visible = true
		$"../../R_Attack_AnimatedSprite2D".play("stab_animation")



func Update(delta : float):
	#check_death()
	enemy = get_tree().get_first_node_in_group("MiniBosses")
	
	player_enemy_Distance = abs(player.global_position - enemy.global_position)
	print(player_enemy_Distance.x)

func PhysicsUpdate(delta : float):
	# checking if player exists
	if player:
		
		if GameManagerSingleton.nutcrackerHealth == 0:
			get_tree().change_scene_to_file("res://Scenes/final_boss_character_body_2d.tscn")
		
		if player_enemy_Distance.x < 30.0:
			GameManagerSingleton.nutcrackerHealth -= 10
			print(GameManagerSingleton.nutcrackerHealth)
	
	# attack states
	if Input.is_action_just_pressed("Slash"):
		Transitioned.emit(self, "SilentKnightSlash")
	elif Input.is_action_just_pressed("Stab"):
		Transitioned.emit(self, "SilentKnightStab")
	
	# move states
	if Input.is_action_just_pressed("jump") or  Input.is_action_just_pressed("move_left")  or  Input.is_action_just_pressed("move_right"):
		 
		if (direction > 0 or Input.is_action_pressed("move_right")) or (direction < 0 or Input.is_action_pressed("move_left")): # moving right
			Transitioned.emit(self, "SilentKnightMove")
			
		if Input.is_action_just_pressed("jump") and player.is_on_floor():
			Transitioned.emit(self, "SilentKnightJump")
		
	else:
		Transitioned.emit(self, "SilentKnightIdle")
