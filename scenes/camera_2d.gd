extends Camera2D

var shake_strength: float = 0.0
var shake_decay: float = 2.5  # vitesse à laquelle le shake se calme

func _process(delta: float) -> void:
	if shake_strength > 0:
		offset = Vector2(
			randf_range(-shake_strength, shake_strength),
			randf_range(-shake_strength, shake_strength)
		)

		shake_strength = max(shake_strength - shake_decay * delta, 0)
	else:
		offset = Vector2.ZERO
