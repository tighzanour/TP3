extends Area2D

@export var key_id: String = "key_2"

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		global.add_key(key_id)
		get_tree().change_scene_to_file("res://scenes/LOBBY.tscn")
