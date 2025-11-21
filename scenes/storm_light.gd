extends DirectionalLight2D

var min_interval := 5.0
var max_interval := 10.0
var flash_duration := 0.2  
var min_flicker := 0.05   
var max_flicker := 0.1    
var flicker_count := 3    

func _ready():
	randomize()
	energy = 0
	flash_loop()

func flash_loop() -> void:
	while true:
		var wait_time: float = randf_range(min_interval, max_interval)
		await get_tree().create_timer(wait_time).timeout
		
		for i in range(flicker_count):
			energy = randf_range(0.5, 1.5) 
			var flicker_time: float = randf_range(min_flicker, max_flicker)
			await get_tree().create_timer(flicker_time).timeout
			energy = 0
