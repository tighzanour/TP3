extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		if global.keys >= 1:
			print("Entering level 2.")
			get_tree().change_scene_to_file("res://scenes/world_2.tscn")
		else:
			print("You need 1 keys to enter.")
