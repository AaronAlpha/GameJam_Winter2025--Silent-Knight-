extends CharacterBody2D


const SPEED = 10

var move_dir
var wander_time

func random_wander():
	move_dir = Vector2(  randf_range(0, 1) , 0 ) # ensuring that enemy does not idle_move in the y-axis
	
	wander_time = randf_range(1,2)
	
	while wander_time >= 0:
		wander_time -= 1
	
	return move_dir
	

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	random_wander()
	
	velocity.x = move_dir.x * SPEED


	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	$AnimatedSprite2D.play("attack_animation")
	GameManagerSingleton.playerHealth -= 0.1
	if GameManagerSingleton.playerHealth == 0:
		get_tree().change_scene_to_file("res://Scenes/credits_control.tscn")
	print(GameManagerSingleton.playerHealth )



func _on_area_2d_body_exited(body: Node2D) -> void:
	$AnimatedSprite2D.play("idle_animation")
