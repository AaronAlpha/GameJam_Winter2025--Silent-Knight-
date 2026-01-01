extends State

class_name SilentKnightMove


@export var player : CharacterBody2D
@export var move_speed := 100


func SK_facingDir():
	var direction := Input.get_axis("move_left", "move_right")
	
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
		if direction > 0 or Input.is_action_pressed("move_right"):
			
			# if it does exist: set velocity...
			player.velocity.x = direction * move_speed
			# should only be in x-axis
		
		elif direction < 0 or Input.is_action_pressed("move_left"):
			# if it does exist: set velocity...
			player.velocity.x = direction * move_speed
			# should only be in x-axis
		else:
			player.velocity.x = move_toward(player.velocity.x, 0, move_speed)


	# attack change states
	if Input.is_action_just_pressed("Slash"):
		Transitioned.emit(self, "SilentKnightSlash")
	elif Input.is_action_just_pressed("Stab"):
		Transitioned.emit(self, "SilentKnightStab")

	# movement change states AND interact change state
	# change state to idle if the player's Vector2 coord are (0,0) -> (Vector2.ZERO)
	# OR change state to idle if the player has interacted with an obj
	if player.velocity == Vector2.ZERO or Input.is_action_just_pressed("interact_with_obj"): 
		Transitioned.emit(self, "SilentKnightIdle")
	
	elif Input.is_action_just_pressed("jump") and player.is_on_floor():
		Transitioned.emit(self, "SilentKnightJump")
	
	elif Input.is_action_pressed("crouch") and player.is_on_floor():
		Transitioned.emit(self, "SilentKnightCrouch")
	
	else:
		Transitioned.emit(self, "SilentKnightFall")
