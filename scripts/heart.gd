extends Area2D

@onready var sound: AudioStreamPlayer2D = $pickup
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D



func _on_body_entered(body: Node2D):
	print('a')
	sound.play()
	animated_sprite_2d.hide()
	collision_shape_2d.set_deferred("disabled", true)
	await sound.finished
	queue_free()
