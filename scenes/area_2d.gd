extends Area2D

func _on_body_entered(body: Node2D) -> void:
	print("body entered")
	get_tree().change_scene_to_file("res://scenes/world_2.tscn")
	print("debug:", body.name)
