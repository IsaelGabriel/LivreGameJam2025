extends Node

@export var next_scene: PackedScene

func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.is_pressed():
		get_tree().change_scene_to_packed(next_scene)
