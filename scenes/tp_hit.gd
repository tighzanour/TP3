extends CollisionShape2D

@onready var tp_hit: CollisionShape2D = $"."


func _on_body_entered(body: Node2D):
	print('next level')
	get_tree().change_scene_to_file("res://scenes/world_2.tscn")
