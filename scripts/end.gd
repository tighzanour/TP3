extends Control

@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer
@onready var bg: Panel = $Panel

func _ready() -> void:
	audio_stream_player.play()

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/loading.tscn")

func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/button_2.tscn")


func _on_button_3_pressed() -> void:
	get_tree().quit()

const STRENGTH := 20
const SMOOTH := 6.0      

func _process(delta: float) -> void:
	var mouse = get_viewport().get_mouse_position()
	var screen_center = get_viewport().get_visible_rect().size / 2
	var offset = (mouse - screen_center) / STRENGTH
	bg.position = bg.position.lerp(offset, delta * SMOOTH)
