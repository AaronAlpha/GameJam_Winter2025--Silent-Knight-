extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -300.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	
	if direction > 0:
		$AnimatedSprite2D.flip_h = false
		playerAttack(delta)
	elif direction < 0:
		$AnimatedSprite2D.flip_h = true
		playerAttack(delta)
	
	# play animations
	# characterBody2D has a built-in function to check if character is on the 'floor': is_on_floor()
	if is_on_floor():
		if direction == 0:
			$AnimatedSprite2D.play("idle_animation")
			playerAttack(delta)
		elif direction != 0:
			$AnimatedSprite2D.play("move_animation")
			playerAttack(delta)
	elif not is_on_floor():
		$AnimatedSprite2D.play("fall_animation")
		
	if Input.is_action_just_pressed("ui_up"):
		$AnimatedSprite2D.play("jump_animation")
	
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	

func playerAttack(delta:float):
	
	if Input.is_action_just_pressed("e") or Input.is_action_just_pressed("E"):
		$AnimatedSprite2D.play("slash_animation")
	
	elif Input.is_action_just_pressed("q") or Input.is_action_just_pressed("Q"):
		$AnimatedSprite2D.play("stab_animation")



	#var direction := Input.get_axis("ui_left", "ui_right")
	#
	#
	#
	#if not is_on_floor():
		#velocity += get_gravity() * delta
	#
	## movement = right
	#if direction > 0:
		#velocity.x = SPEED
		#
		#$AnimatedSprite2D.flip_h = false
		#$AnimatedSprite2D.play("move_animation")
	#
	## movement = left
	#elif direction < 0:
		#
		#velocity.x = -SPEED
		#
		#$AnimatedSprite2D.flip_h = true
		#$AnimatedSprite2D.play("move_animation")
	#
	## when player has no direction and no velocity -> i.e. stationary
	## make knight idle
	#else:
		#$AnimatedSprite2D.play("idle_animation")
	#
		#
	## movement = jump
	#if Input.is_action_just_pressed("ui_up") and is_on_floor():
		#$AnimatedSprite2D.play("jump_animation")
		#velocity.y = JUMP_VELOCITY 
	#
	#
	#
	#if direction:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
		#
	#
		#
		#
	#move_and_slide()
