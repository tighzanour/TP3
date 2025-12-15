extends Node2D

@onready var bass: AudioStreamPlayer = $bass
@export var pitch_min := 0.8
@export var pitch_max := 1.5

func _ready() -> void:
	bass.pitch_scale = randf_range(pitch_min, pitch_max)
	bass.play()
