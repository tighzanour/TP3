extends Area2D



func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		if global.keys >= 2:
			print("Entering level 3.")
			get_tree().change_scene_to_file("res://scenes/world_3_scary.tscn")
		else:
			print("You need 2 keys to enter.")
