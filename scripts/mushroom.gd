extends Node2D

const SPEED = 60
const GRAVITY = 200
var direction = 1
var velocity = Vector2.ZERO
var is_on_floor = false

func _physics_process(delta: float):
	if not is_on_floor:
		velocity.y += GRAVITY * delta

	position += velocity * delta
	position.x += direction * SPEED * delta
