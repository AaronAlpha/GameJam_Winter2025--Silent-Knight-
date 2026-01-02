extends SilentKnight_States

class_name SilentKnightJump



func Enter():

	#check_death()

	
	#if jump == false and player.is_on_floor():
	$"../../AnimatedSprite2D".play("jump_animation")
		
		#jump = true
	

func Update(delta : float):
	#check_death()
	pass

func PhysicsUpdate(delta : float):
	if player:
		
		player.velocity.y = jumpSpeed # adding the jump velocity to the player
		Transitioned.emit(self, "SilentKnightMove")

		#if direction > 0 or Input.is_action_pressed("move_right"):
			#
			## if it does exist: set velocity...
			#player.velocity.x = direction * move_speed
			## should only be in x-axis
			##Transitioned.emit(self, "SilentKnightMove")
		#
		#elif direction < 0 or Input.is_action_pressed("move_left"):
			## if it does exist: set velocity...
			#player.velocity.x = direction * move_speed
			## should only be in x-axis
			#Transitioned.emit(self, "SilentKnightMove")
		#else:
			##player.velocity.x = move_toward(player.velocity.x, 0, move_speed)
			#Transitioned.emit(self, "SilentKnightIdle")
		
		#jump = true
		
		
		#if direction > 0 or Input.is_action_pressed("move_right"):
		#
			## if it does exist: set velocity...
			#player.velocity.x = direction * move_speed
			## should only be in x-axis
			#Transitioned.emit(self, "SilentKnightMove")
			#

	


		
		
		
	
