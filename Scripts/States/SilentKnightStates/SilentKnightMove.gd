extends SilentKnight_States

class_name SilentKnightMove



# and then when we Enter() this state (EnemyIdle state), we call the randomizer func
func Enter():
	$"../../AnimatedSprite2D".play("move_animation")
	
	# code that alters the dir the animatedSprite and collisionShape should face
	SK_facingDir()
	

func Update(delta : float):
	
	# code that alters the dir the animatedSprite and collisionShape should face
	SK_facingDir()
			


func PhysicsUpdate(delta : float):
	var direction := Input.get_axis("move_left", "move_right")
	
	# check if player node exists:
	if player:
		#if direction > 0 or Input.is_action_pressed("move_right"):
			#
			## if it does exist: set velocity...
			#player.velocity.x = direction * move_speed
			## should only be in x-axis
		#
		#elif direction < 0 or Input.is_action_pressed("move_left"):
			## if it does exist: set velocity...
			#player.velocity.x = direction * move_speed
			## should only be in x-axis
		#else:
			#player.velocity.x = move_toward(player.velocity.x, 0, move_speed)
		movement(delta)


	## attack change states
	#if Input.is_action_just_pressed("Slash"):
		#Transitioned.emit(self, "SilentKnightSlash")
	#elif Input.is_action_just_pressed("Stab"):
		#Transitioned.emit(self, "SilentKnightStab")
	attackStates() # condensed func that includes code above - refer SK_States.gd for code

	# movement change states AND interact change state
	# change state to idle if the player's Vector2 coord are (0,0) -> (Vector2.ZERO)
	# OR change state to idle if the player has interacted with an obj
	#if player.velocity == Vector2.ZERO or Input.is_action_just_pressed("interact_with_obj"): 
		#Transitioned.emit(self, "SilentKnightIdle")
	#
	#elif Input.is_action_just_pressed("jump") and player.is_on_floor():
		#Transitioned.emit(self, "SilentKnightJump")
	#
	#elif Input.is_action_pressed("crouch") and player.is_on_floor():
		#Transitioned.emit(self, "SilentKnightCrouch")
	#
	#else:
		#Transitioned.emit(self, "SilentKnightFall")
	moveStates()
