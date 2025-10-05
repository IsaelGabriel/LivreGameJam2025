extends Node
class_name Damageable

@export var max_hp: int = 3
@export var hearts_ui_container: Control
@export var heart_prefab: PackedScene

var current_hp: int = 3

func _ready() -> void:
	current_hp = max_hp
	for i in range(max_hp):
		var heart = heart_prefab.instantiate()
		hearts_ui_container.add_child(heart)
