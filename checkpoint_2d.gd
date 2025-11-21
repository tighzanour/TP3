extends Area2D

@onready var timer_node: Node2D = $"."

func _on_body_entered(body: Node2D) -> void:
	Checkpoint.last_position = global_position
	if body.name == "player":
		
		var final_time = timer_node.stop_and_get_time()
		print("FINAL TIME:", final_time)
