extends CharacterBody2D



func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta


	move_and_slide()


# these 2 signals are used to check if the player entered the area

func _on_hit_box_area_2d_body_entered(body: Node2D) -> void:
	pass # Replace with function body.


func _on_hit_box_area_2d_body_exited(body: Node2D) -> void:
	pass # Replace with function body.
