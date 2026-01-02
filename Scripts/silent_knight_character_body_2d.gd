extends CharacterBody2D
#
#
#func _ready() -> void:
	#$AnimatedSprite2D.play("idle_animation")


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	move_and_slide()


# the following 2 signals are used to check if the animation of the death, slash and stab are committed

func _on_l_attack_animated_sprite_2d_2_animation_finished() -> void:
	pass # Replace with function body.


func _on_r_attack_animated_sprite_2d_animation_finished() -> void:
	pass # Replace with function body.
