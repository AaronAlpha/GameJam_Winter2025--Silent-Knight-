extends State

class_name SilentKnight_States

@export var player : CharacterBody2D
@export var idle_move_speed := 20 # for idle_state
@export var move_speed := 100 # for move_state
@export var jumpSpeed : int = -100 # for jump_state
var enemy : CharacterBody2D

var direction := Input.get_axis("move_left", "move_right") # made this a class_var so that can be 
# accessed in other classes

var player_enemy_Distance = 0

var death : bool = false
var slash : bool = false 
var stab : bool = false 


func SK_facingDir():
	if direction > 0 or Input.is_action_pressed("move_right"): # moving right
		$"../../AnimatedSprite2D".flip_h = false
			 
	elif direction < 0 or Input.is_action_pressed("move_left"): # moving left
		$"../../AnimatedSprite2D".flip_h = true


func movement(delta):
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

func moveStates():
	if player.velocity == Vector2.ZERO or Input.is_action_just_pressed("interact_with_obj"): 
		Transitioned.emit(self, "SilentKnightIdle")
	
	elif Input.is_action_just_pressed("jump") and player.is_on_floor():
		Transitioned.emit(self, "SilentKnightJump")
	
	elif Input.is_action_pressed("crouch") and player.is_on_floor():
		Transitioned.emit(self, "SilentKnightCrouch")
	
	else:
		Transitioned.emit(self, "SilentKnightFall")


func attackStates():
	# attack change states
	if Input.is_action_just_pressed("Slash"):
		Transitioned.emit(self, "SilentKnightSlash")
	elif Input.is_action_just_pressed("Stab"):
		Transitioned.emit(self, "SilentKnightStab")


# for the death/slash/stab acnimations
func attackAnimations(animation_name):
	# animation_name has to be a text (i.e. it has to be in quotes)
	if direction > 0 or Input.is_action_pressed("move_right"): # moving right
		$"../../AnimatedSprite2D".visible = false
		$"../../L_AnimatedSprite2D".visible = true
		$"../../L_AnimatedSprite2D".play(animation_name)
		
	elif direction < 0 or Input.is_action_pressed("move_left"): # moving left
		$"../../AnimatedSprite2D".visible = false
		$"../../R_AnimatedSprite2D".visible = true
		$"../../R_AnimatedSprite2D".play(animation_name)
	
	# disabling the collision shapes
	$"../../CollisionShape2D".visible = false
	$"../../CollisionShape2D".disabled = true
	$"../../Crouch_CollisionShape2D".visible = false
	$"../../Crouch_CollisionShape2D".disabled = true



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
