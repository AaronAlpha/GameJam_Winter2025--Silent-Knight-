extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -300.0



func _physics_process(delta: float) -> void:
	## Add the gravity.
	#if not is_on_floor():
		#velocity += get_gravity() * delta
#
	## Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#$JumpDelay_Timer.start()
		#
#
	## Get the input direction and handle the movement/deceleration.
	## As good practice, you should replace UI actions with custom gameplay actions.
	#var direction := Input.get_axis("ui_left", "ui_right")
	#
	#
	#if direction > 0:
		## direction = 1 --> right
		#$AnimatedSprite2D.flip_h = false
		#$AnimatedSprite2D.play("move_animation")
		##CollisionShape2D.position[0] *= -1
		##CollisionShape2D.position[1] *= -1
	#elif direction < 0:
		## direction = -1 --> left
		#$AnimatedSprite2D.flip_h = true
		#$AnimatedSprite2D.play("move_animation")
		#$CollisionShape2D.position[0] *= -1
		#
		#
	#if is_on_floor():
		#if direction == 0:
			#$AnimatedSprite2D.play("idle_animation")
		#elif direction != 0:
			#$AnimatedSprite2D.play("move_animation")
	#else:
		##$AnimatedSprite2D.play("jump_animation")
		#$JumpAnimationStart_Timer.start()
#
#
	#
	## if direction is True, multiplies direction (-1, 0, 1) to SPEED
	#if direction:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)

	
	playerMovement(delta)
	
	

func playerMovement(delta):
	
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	# movement right
	if Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
		
		$AnimatedSprite2D.flip_h = false
		$AnimatedSprite2D.play("move_animation")
	
	# movement left
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED
		
		$AnimatedSprite2D.flip_h = true
		$AnimatedSprite2D.play("move_animation")
		
		# because of the width of the sprite, the collision shape needs to be flipped across the y axis 
		# to 'be with' the sprite after flipping
		$CollisionShape2D.position[0] *= -1

		
	else:
		$AnimatedSprite2D.play("idle_animation")
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	# jump
	if Input .is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY 
		
		$AnimatedSprite2D.play("jump_animation")
	
	
	
	move_and_slide()
