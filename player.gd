extends CharacterBody2D

const SPEED = 130.0
const JUMP_VELOCITY = -243.0
const MAX_JUMPS = 2
const SLIDE_SPEED = 170.0
const SLIDE_DURATION = 0.5  # seconds

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var footsteps: AudioStreamPlayer2D = $footsteps
@onready var killzone: Node2D = $"../killzone_back"
@onready var cam: Camera2D = $Camera2D



var jumps_done = 0
var sliding = false
var slide_timer = 0.0

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	else:
		jumps_done = 0
		if sliding:
			sliding = true  # Stop slide when touching ground again

	# --- SLIDE LOGIC ---
	if Input.is_action_pressed("down") and not sliding:
		sliding = true
		slide_timer = SLIDE_DURATION

	if sliding:
		slide_timer -= delta
		if slide_timer <= 0:
			sliding = false

	# --- JUMP LOGIC ---
	if Input.is_action_just_pressed("ui_accept") and jumps_done < MAX_JUMPS and not sliding:
		velocity.y = JUMP_VELOCITY
		jumps_done += 1

	# --- MOVEMENT ---
	var direction := Input.get_axis("left", "right")

	if sliding:
		var slide_dir = 1 if not animated_sprite.flip_h else -1
		velocity.x = slide_dir * SLIDE_SPEED
	else:
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)

	# --- FLIP SPRITE ---
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true

	# --- ANIMATIONS ---
	if sliding:
		animated_sprite.play("slide")
	elif not is_on_floor():
		animated_sprite.play("jumping")
	elif direction == 0:
		animated_sprite.play("idle")
	else:
		animated_sprite.play("run")

	move_and_slide()

	# --- FOOTSTEPS SOUND ---
	var move_axis := Input.get_axis("left", "right")

	if is_on_floor() and move_axis != 0 and not sliding:
		if not footsteps.playing:
			footsteps.play()
	else:
		if footsteps.playing:
			footsteps.stop()
			
	# --- CAMERA SHAKE BASED ON DISTANCE TO KILLZONE ---
	var dist = global_position.distance_to(killzone.global_position)

	var maxDist = 900.0  # distance à partir de laquelle il n'y a plus de shake
	var intensity = clamp(1.0 - (dist / maxDist), 0.0, 1.0)
	cam.shake_strength = intensity * 1.0
