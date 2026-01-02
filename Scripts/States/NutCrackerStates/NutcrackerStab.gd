extends State

class_name NutcrackerStab

@export var enemy : CharacterBody2D
var player : CharacterBody2D

var stabTimeOut : bool = false

var direction



func Enter():
	
	player = get_tree().get_first_node_in_group("Player")
	
	direction = player.global_position - enemy.global_position
	
	
	enemy.velocity = Vector2.ZERO
	$"../../AnimatedSprite2D".stop()
	$"../../AnimatedSprite2D".visible = false
	
	
	$"../../Attack_AnimatedSprite2D".visible = true
	if direction[0] > 0: # chceking the sign of the x values
		# if dir is +ve -> i.e. facing right
		$"../../Attack_AnimatedSprite2D".flip_h = true
		$"../../LeftFacing_CollisionShape2D".visible = false
		$"../../LeftFacing_CollisionShape2D".disabled = true
		$"../../RightFacing_CollisionShape2D".visible = true
		$"../../RightFacing_CollisionShape2D".disabled = false
	else:
		# if dir is -ve -> i.e. facing left
		$"../../Attack_AnimatedSprite2D".flip_h = false
		$"../../LeftFacing_CollisionShape2D".visible = true
		$"../../LeftFacing_CollisionShape2D".disabled = false
		$"../../RightFacing_CollisionShape2D".visible = false
		$"../../RightFacing_CollisionShape2D".disabled = true
	$"../../Attack_AnimatedSprite2D".play("stab_animation")

func Update(delta):

	player = get_tree().get_first_node_in_group("Player")
	
	direction = player.global_position - enemy.global_position
	

func PhysicsUpdate(delta):
	if enemy:
		
		GameManagerSingleton.playerHealth -= 1
		
		print(GameManagerSingleton.playerHealth)
		
		if GameManagerSingleton.playerHealth == 0:
			get_tree().change_scene_to_file("res://Scenes/credits_control.tscn")



	
	direction = player.global_position - enemy.global_position 
	
	if direction.length() > 100:
		Transitioned.emit(self, "NutcrackerIdle")
	
	elif direction.length() < 100:
		Transitioned.emit(self, "NutcrackerFollow")
		
	elif direction.length() < 25:
		Transitioned.emit(self, "NutcrackerSlash")
	

	
		
