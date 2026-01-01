extends CharacterBody2D


func _ready() -> void:
	$AnimatedSprite2D.play("idle_animation")


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	move_and_slide()
