extends CollisionShape2D


# Called when the node enters the scene tree for the first time.
func _on_area_2d_body_entered(body: Node2D) -> void:
	print('body entered')
	get_tree().change_scene_to_file("res://scenes/world_2.tscn")
	queue_free()
