extends Node

var keys := 0
var collected_keys := {} 

signal key_collected(count)


func add_key(key_id: String) -> void:
	if not collected_keys.has(key_id):
		collected_keys[key_id] = true
		keys += 1
		emit_signal("key_collected", keys)
