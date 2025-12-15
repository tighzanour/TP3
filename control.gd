extends Control

var progress := []
var scene_path := "res://scenes/LOBBY.tscn"
var load_status := 0
var scene_instance

@onready var label: Label = $pourcentage

func _ready():
	$pourcentage.text = "0%"
	ResourceLoader.load_threaded_request(scene_path)

func _process(delta):
	load_status = ResourceLoader.load_threaded_get_status(scene_path, progress)

	
	if progress.size() > 0:
		$pourcentage.text = str(floor(progress[0] * 100)) + "%"

	
	if load_status == ResourceLoader.THREAD_LOAD_LOADED:
		scene_instance = ResourceLoader.load_threaded_get(scene_path)
		get_tree().change_scene_to_packed(scene_instance)
