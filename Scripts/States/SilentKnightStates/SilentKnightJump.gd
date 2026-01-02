extends SilentKnight_States

class_name SilentKnightJump



func Enter():
	$"../../CollisionShape2D".visible = true
	$"../../CollisionShape2D".disabled = false

	

	#check_death()

	
	#if jump == false and player.is_on_floor():
	$"../../AnimatedSprite2D".play("jump_animation")
		
		#jump = true
	

func Update(delta : float):
	#check_death()
	pass

func PhysicsUpdate(delta : float):
	if player:
		
		#player.velocity.y = jumpSpeed # adding the jump velocity to the player

		if direction > 0 or Input.is_action_pressed("move_right"):
			
			# if it does exist: set velocity...
			#player.velocity.x = direction * move_speed
			# should only be in x-axis
			Transitioned.emit(self, "SilentKnightMove")
		
		elif direction < 0 or Input.is_action_pressed("move_left"):
			# if it does exist: set velocity...
			#player.velocity.x = direction * move_speed
			# should only be in x-axis
			Transitioned.emit(self, "SilentKnightMove")
		else:
			#player.velocity.x = move_toward(player.velocity.x, 0, move_speed)
			Transitioned.emit(self, "SilentKnightIdle")
		
		#jump = true
		
		
		#if direction > 0 or Input.is_action_pressed("move_right"):
		#
			## if it does exist: set velocity...
			#player.velocity.x = direction * move_speed
			## should only be in x-axis
			#Transitioned.emit(self, "SilentKnightMove")
			#
		
	
	#if jump == true:
		
		# attack states
	if Input.is_action_just_pressed("Slash"):
		Transitioned.emit(self, "SilentKnightSlash")
	elif Input.is_action_just_pressed("Stab"):
		Transitioned.emit(self, "SilentKnightStab")
	
	
	# move states
	if ((direction > 0 or Input.is_action_pressed("move_right")) or (direction < 0 or Input.is_action_pressed("move_left"))) and player.is_on_floor():


		Transitioned.emit(self, "SilentKnightMove")
	elif Input.is_action_just_pressed("jump") and player.is_on_floor():
		#jump = false
		Transitioned.emit(self, "SilentKnightJump")
	#
	elif !player.is_on_floor():
		#jump = false
		Transitioned.emit(self, "SilentKnightFall")
		
	else:

		Transitioned.emit(self, "SilentKnightIdle")
			
		
		
		
	
