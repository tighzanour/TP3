extends Area2D

@onready var timer: Timer = $Timer
@onready var death: AudioStreamPlayer2D = $death


func _on_body_entered(body: Node2D):
	print('player died')
	timer.start()
	
func _on_timer_timeout():
	get_tree().reload_current_scene()
