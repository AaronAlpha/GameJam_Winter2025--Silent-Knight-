extends Area2D


func _on_body_entered(body: Node2D) -> void:
	GameManagerSingleton.playerSpeed += 50
	queue_free()
