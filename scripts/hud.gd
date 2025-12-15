extends CanvasLayer

@onready var keys_label = $keys

func _ready():
	global.connect("key_collected", Callable(self, "set_keys"))
	keys_label.text = str(global.keys)

func set_keys(count):
	keys_label.text = str(count)
