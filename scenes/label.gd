extends Label

@export var bpm = 80                # Beats per minute
@export var scale_amount = 1    # Max scale
@export var shake_intensity = 1.2  # Pixels

var original_scale = Vector2.ONE
var original_position = Vector2.ZERO
var time_passed = 0.0
var seconds_per_beat = 60.0 / bpm

func _ready():
	original_scale = scale
	original_position = position

func _process(delta):
	time_passed += delta
	
	# --- Pulse (scale) ---
	var pulse = abs(sin(time_passed * TAU / seconds_per_beat))
	scale = original_scale * (1 + pulse * (scale_amount - 1))
	
	# --- Shake (position) ---
	var shake = Vector2(randf_range(-1, 1), randf_range(-1, 1)) * pulse * shake_intensity
	position = original_position + shake
