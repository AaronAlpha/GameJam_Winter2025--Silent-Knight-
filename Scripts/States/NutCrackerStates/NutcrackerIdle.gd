extends State

class_name NutcrackerIdle
@onready var right_facing_collision_shape_2d: CollisionShape2D = $"../../RightFacing_CollisionShape2D"



@export var enemy : CharacterBody2D
@export var idle_move_speed := 20

var player : CharacterBody2D


var move_dir : Vector2
var wander_time : float


func random_wander():
	move_dir = Vector2(  randf_range(-1, 1) , 0 ) # ensuring that enemy does not idle_move in the y-axis
	
	if move_dir[0] > 0: # chceking the sign of the x values
		# if dir is +ve -> i.e. facing right
		$"../../AnimatedSprite2D".flip_h = true
		$"../../LeftFacing_CollisionShape2D".visible = false
		$"../../RightFacing_CollisionShape2D".visible = true
	else:
		# if dir is -ve -> i.e. facing left
		$"../../AnimatedSprite2D".flip_h = false
		$"../../LeftFacing_CollisionShape2D".visible = true
		$"../../RightFacing_CollisionShape2D".visible = false
	
	wander_time = randf_range(1, 2)


# and then when we Enter() this state (EnemyIdle state), we call the randomizer func
func Enter():
	$"../../AnimatedSprite2D".play("move_animation")
	
	
	player = get_tree().get_first_node_in_group("Player")
	
	random_wander()

func Update(delta : float):
	
	# we check if the wander_time is greater than 0
	if wander_time > 0:
		# if true, we tick it down using delta
		wander_time -= delta
	
	# otherwise, call randomizer func again and randomize the variables again
	else:
		random_wander()


func PhysicsUpdate(delta : float):
	# check if enemy node exists:
	if enemy:
		# if it does exist: set velocity...
		enemy.velocity = move_dir * idle_move_speed
	
	# this makes sense, becoz 'enemy' is an object of the CharacterBody2D class, which has 
	# class variable Velocity etc
	
	# getting direction between player and enemy
	var direction = player.global_position - enemy.global_position
	
	# if distance (direction) is within some threshold, we transition from Idle to Follow
	if direction.length() < 25:
		Transitioned.emit(self, "EnemyFollow")
	
	
