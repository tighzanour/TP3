extends Area2D

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var sound: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var interact_label: TextureRect = $"../player/Camera2D/TextureRect"
@onready var texture_rect_2: TextureRect = $"../player/Camera2D/TextureRect2"

var player_near := false 
var showing_temp := false

func _ready():
	interact_label.visible = false  
	texture_rect_2.visible = false

func _on_body_entered(body):
	if body.is_in_group("player"):
		player_near = true
		if not showing_temp:
			interact_label.visible = true
		print("Player is near")

func _on_body_exited(body):
	if body.is_in_group("player"):
		player_near = false
		interact_label.visible = false
		texture_rect_2.visible = false
		showing_temp = false
		print("Player left")

func _physics_process(delta):
	if player_near and Input.is_action_just_pressed("interact") and not showing_temp:
		interact_label.visible = false
		texture_rect_2.visible = true
		showing_temp = true
		sound.play()
		print("Sound played!")

		await get_tree().create_timer(0.3).timeout
		texture_rect_2.visible = false
		if player_near:
			interact_label.visible = true
		showing_temp = false
