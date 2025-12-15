extends Node2D


const SPEED = 90

func _process(delta: float) -> void:
	position.x += SPEED * delta
