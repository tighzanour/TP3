extends CanvasLayer

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		_escape()

func _escape() -> void:
	# Hide the menu or do your escape logic
	visible = false
	# Optional: play a sound, reset variables, go back to main scene...
	print("Escape pressed!")
