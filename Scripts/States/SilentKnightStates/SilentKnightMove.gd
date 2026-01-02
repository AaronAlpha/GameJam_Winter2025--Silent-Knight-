extends SilentKnight_States

class_name SilentKnightMove



# and then when we Enter() this state (EnemyIdle state), we call the randomizer func
func Enter():	
	#check_death()
	
	
	$"../../L_Attack_AnimatedSprite2D".visible = false
	$"../../L_Attack_AnimatedSprite2D".stop()
	$"../../R_Attack_AnimatedSprite2D".visible = false
	$"../../R_Attack_AnimatedSprite2D".stop()
	
	$"../../AnimatedSprite2D".visible = true

	$"../../AnimatedSprite2D".play("move_animation")
	
	
	
	# code that alters the dir the animatedSprite and collisionShape should face
	SK_facingDir()
	

func Update(delta : float):
	
	#if GameManager_Singleton.playerHealth == 0:
		#Transitioned.emit(self, "SilentKnightDeath")
	
	# code that alters the dir the animatedSprite and collisionShape should face
	SK_facingDir()
			


func PhysicsUpdate(delta : float):
	var direction := Input.get_axis("move_left", "move_right")
	
	# check if player node exists:
	if player:
		
		
		
		if direction > 0 or Input.is_action_pressed("move_right"):
			# if it does exist: set velocity...
			player.velocity.x = direction * GameManagerSingleton.playerSpeed
			# should only be in x-axis
	
		
		elif direction < 0 or Input.is_action_pressed("move_left"):
			# if it does exist: set velocity...
			player.velocity.x = direction * GameManagerSingleton.playerSpeed
			# should only be in x-axis

		else:
			player.velocity.x = move_toward(player.velocity.x, 0, move_speed)
			#Transitioned.emit(self, "SilentKnightIdle")

	# attackStates
	if Input.is_action_just_pressed("Slash"):
		Transitioned.emit(self, "SilentKnightSlash")
		
	elif Input.is_action_just_pressed("Stab"):
		Transitioned.emit(self, "SilentKnightStab")
	
	
	# move states
		 
	if (direction > 0 or Input.is_action_pressed("move_right")) or (direction < 0 or Input.is_action_pressed("move_left")): # moving right
		if Input.is_action_just_pressed("jump") and player.is_on_floor():
			player.velocity.y = jumpSpeed
			Transitioned.emit(self, "SilentKnightMove")
		
	else:
		Transitioned.emit(self, "SilentKnightIdle")
