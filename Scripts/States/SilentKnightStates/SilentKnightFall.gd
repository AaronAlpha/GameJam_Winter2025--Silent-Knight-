extends SilentKnight_States

class_name SilentKnightFall


func Enter():
	check_death()
	$"../../AnimatedSprite2D".play("fall_animation")

func Update(delta : float):
	#check_death()
	pass

func PhysicsUpdate(delta : float):
	if player:
		movement(delta)
	
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
