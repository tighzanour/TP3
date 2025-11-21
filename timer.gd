extends Node2D

@onready var label: Label = $Label
@onready var timer: Timer = $Timer

var total_centiseconds: int = 0   # 1 unité = 0.01s

func _ready() -> void:
	reset_timer()

func reset_timer() -> void:
	total_centiseconds = 0
	label.text = "00:00:00"
	timer.start()

func stop_and_get_time() -> String:
	timer.stop()
	var cs = total_centiseconds % 100
	var total_seconds = total_centiseconds / 100
	var m = int(total_seconds / 60)
	var s = int(total_seconds % 60)
	return "%02d:%02d:%02d" % [m, s, cs]

func _on_timer_timeout() -> void:
	total_centiseconds += 1  # +0.01s

	var cs = total_centiseconds % 100
	var total_seconds = total_centiseconds / 100
	var m = int(total_seconds / 60)
	var s = int(total_seconds % 60)

	label.text = "%02d:%02d:%02d" % [m, s, cs]
