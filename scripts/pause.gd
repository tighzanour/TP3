extends Control

func _ready():
	visible = false

func pause():
	get_tree().paused = true
	visible = true

func _input(_event):
	if Input.is_action_just_pressed("pause"):
		if get_tree().paused:
			_on_resume_pressed()
		else:
			pause()

func _on_menu_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/menu.tscn")


func _on_resume_pressed() -> void:
	get_tree().paused = false
	visible = false
