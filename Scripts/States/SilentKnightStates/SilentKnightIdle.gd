extends State

class_name SilentKnightIdle


@export var player : CharacterBody2D
@export var idle_move_speed := 20


# and then when we Enter() this state (EnemyIdle state), we call the randomizer func
func Enter():
	$"../../AnimatedSprite2D".play("idle_animation")


func Update(delta : float):
	pass


func PhysicsUpdate(delta : float):
	var direction := Input.get_axis("ui_left", "ui_right")
	
	# check if player node exists:
	if player:
		# if it does exist: check keyPress and change state
		if direction > 0 or Input.is_action_pressed("move_right"): # moving right
			$"../../AnimatedSprite2D".flip_h = false
			# the animation and collision should be 'on' on the left of the y-axis
			$"../../LeftFacing_CollisionShape2D".visible = true
			$"../../LeftFacing_CollisionShape2D".disabled = false
			# the animation and collision should be 'off' on the right of the y-axis
			$"../../RightFacing_CollisionShape2D".visible = false
			$"../../RightFacing_CollisionShape2D".disabled = true
			 
		elif direction < 0 or Input.is_action_pressed("move_left"): # moving left
			$"../../AnimatedSprite2D".flip_h = true
			# the animation and collision should be 'off' on the left of the y-axis
			$"../../LeftFacing_CollisionShape2D".visible = false
			$"../../LeftFacing_CollisionShape2D".disabled = true
			# the animation and collision should be 'on' on the right of the y-axis
			$"../../RightFacing_CollisionShape2D".visible = true
			$"../../RightFacing_CollisionShape2D".disabled = false
				
		
		
		#enemy.velocity = move_dir * idle_move_speed
		
		
	
		#if Input.is_action_just_pressed("ui_up") and player.is_on_floor():
			##$AnimatedSprite2D.play("jmup_animation")
			#velocity.y = JUMP_VELOCITY

		
	
	# if distance (direction) is within some threshold, we transition from Idle to Follow
	#if direction.length() < 100:
		#Transitioned.emit(self, "NutcrackerFollow")
		
		
		
		
		



	
		
	#
	## play animations
	## characterBody2D has a built-in function to check if character is on the 'floor': is_on_floor()
	#if is_on_floor():
		#if direction == 0:
			#$AnimatedSprite2D.play("idle_animation")
		#elif direction != 0:
			#$AnimatedSprite2D.play("move_animation")
	#elif Input.is_action_just_pressed("ui_up") and is_on_floor():
		#$AnimatedSprite2D.play("jump_animation")
#
##
	##if Input.is_action_just_pressed("ui_up") and is_on_floor():
		##$AnimatedSprite2D.stop()
		##$AnimatedSprite2D.play("new_animation_1")
		##
	#
	#
	#if direction:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
	#
	
