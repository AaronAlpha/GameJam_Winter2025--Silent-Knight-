extends State

class_name FinalBossFollow


@export var enemy : CharacterBody2D
@export var follow_move_speed := 30.0


var player : CharacterBody2D

func Enter():
	
	$"../../Move_AnimatedSprite2D".play("chase_animation")
	
	player = get_tree().get_first_node_in_group("Player")
	
func PhysicsUpdate(_delta : float):
	# getting direction between player and enemy
	var direction = player.global_position - enemy.global_position
	direction.y = 0 # ensuring that the enemy does not move in the y-axis
	
	# and if the direction is outside some distance
	if direction.length() > 5: # distance between enemy and player when enemy is near player
		# move the enemy toward the player
		enemy.velocity = direction.normalized() * follow_move_speed
	else:
		# otherwise have it stand still
		enemy.velocity = Vector2()


	# Transitioning between states is state-dependent; 
	# following is transitioning from follow to idle
	# want follow state to go back to being idle once reached a certain threshold
	if direction.length() > 100:
		Transitioned.emit(self, "FinalBossIdle")
		# above passes in 'self' (which is the current_state) and 'idle' (which is the new_state we want to 
		# Transition to)
