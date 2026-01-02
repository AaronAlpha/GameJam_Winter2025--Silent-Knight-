extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta


func _on_hit_box_area_2d_body_entered(body: Node2D) -> void:
	$AnimatedSprite2D.play("shoot_animation")
	GameManagerSingleton.playerHealth -= 0.5
	GameManagerSingleton.playerSpeed = 80
	if GameManagerSingleton.playerHealth == 0:
		get_tree().change_scene_to_file("res://Scenes/credits_control.tscn")


func _on_hit_box_area_2d_body_exited(body: Node2D) -> void:
	$AnimatedSprite2D.play("idle_animation")
