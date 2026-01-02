extends SilentKnight_States

class_name SilentKnightJump



func Enter():


	#check_death()
	$"../../L_Attack_AnimatedSprite2D".visible = false
	$"../../L_Attack_AnimatedSprite2D".stop()
	$"../../R_Attack_AnimatedSprite2D".visible = false
	$"../../R_Attack_AnimatedSprite2D".stop()
	
	$"../../AnimatedSprite2D".visible = true
	$"../../AnimatedSprite2D".play("jump_animation")
		

	

func Update(delta : float):
	#check_death()
	pass

func PhysicsUpdate(delta : float):
	if player:
		
		player.velocity.y = jumpSpeed # adding the jump velocity to the player
		
		# move state
	if Input.is_action_just_pressed("jump") or  Input.is_action_just_pressed("move_left")  or  Input.is_action_just_pressed("move_right"):
		 
		if (direction > 0 or Input.is_action_pressed("move_right")) or (direction < 0 or Input.is_action_pressed("move_left")): # moving right
			Transitioned.emit(self, "SilentKnightMove")
			
		if Input.is_action_just_pressed("jump") and player.is_on_floor():

			Transitioned.emit(self, "SilentKnightJump")
		
	else:
		jump = false
		Transitioned.emit(self, "SilentKnightIdle")
