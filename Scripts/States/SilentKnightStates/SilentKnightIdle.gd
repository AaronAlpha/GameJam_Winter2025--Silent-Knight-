extends SilentKnight_States

class_name SilentKnightIdle


# and then when we Enter() this state (EnemyIdle state), we call the randomizer func
func Enter():
	$"../../CollisionShape2D".visible = true
	$"../../CollisionShape2D".disabled = false
	
	#check_death()
	#print("idle")dddd
	$"../../AnimatedSprite2D".play("idle_animation")


func Update(delta : float):
	#check_death()
	pass


func PhysicsUpdate(delta : float):
	
	# check if player node exists:
	if player:
		# if it does exist: check keyPress and change state
		if direction > 0 or Input.is_action_pressed("move_right"): # moving right
			$"../../AnimatedSprite2D".flip_h = false
			Transitioned.emit(self, "SilentKnightMove")
			
		elif direction < 0 or Input.is_action_pressed("move_left"): # moving left
			$"../../AnimatedSprite2D".flip_h = true
			Transitioned.emit(self, "SilentKnightMove")
		
		elif Input.is_action_just_pressed("jump") and player.is_on_floor():
			Transitioned.emit(self, "SilentKnightJump")

		elif !player.is_on_floor():
			Transitioned.emit(self, "SilentKnightFall")
		
		else:
			Transitioned.emit(self, "SilentKnightIdle")
				

	if Input.is_action_just_pressed("Slash"):
		Transitioned.emit(self, "SilentKnightSlash")
	elif Input.is_action_just_pressed("Stab"):
		Transitioned.emit(self, "SilentKnightStab")
	
