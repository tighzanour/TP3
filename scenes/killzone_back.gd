extends Node2D


const SPEED = 100

func _process(delta: float) -> void:
	position.x += SPEED * delta
