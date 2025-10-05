extends Node
class_name Damageable

signal took_damage

@export var max_hp: int = 3
@export var hearts_ui_container: Control
@export var heart_prefab: PackedScene
@export var invincible: bool = false

var current_hp: int = 3


func _ready() -> void:
	current_hp = max_hp
	if not hearts_ui_container: return
	for i in range(max_hp):
		var heart = heart_prefab.instantiate()
		hearts_ui_container.add_child(heart)

func take_damage():
	if invincible: return
	current_hp -= 1
	if hearts_ui_container and current_hp >= 0:
		var heart = hearts_ui_container.get_child(current_hp)
		heart.queue_free()
	took_damage.emit()
	
