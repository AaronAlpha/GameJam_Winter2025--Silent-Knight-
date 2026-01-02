extends Area2D


func _on_body_entered(body: Node2D) -> void:
	GameManagerSingleton.playerHealth += 150
	queue_free()
