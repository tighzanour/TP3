extends CanvasLayer

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		_escape()

func _escape() -> void:
	visible = false
	print("Escape pressed!")
