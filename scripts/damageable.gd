extends Node
class_name Damageable

signal took_damage
signal knockback(direction: Vector2)
signal has_died

@export var max_hp: int = 3
@export var hearts_ui_container: Control
@export var heart_prefab: PackedScene
@export var invincible: bool = false

var current_hp: int = 3
var alive: bool = true

func _ready() -> void:
	current_hp = max_hp
	if not hearts_ui_container: return
	for i in range(max_hp):
		var heart = heart_prefab.instantiate()
		hearts_ui_container.add_child(heart)

func take_damage(ammount: int = 1):
	if invincible or not alive: return
	current_hp -= ammount
	if hearts_ui_container and current_hp >= 0:
		for i in range(ammount):
			var heart = hearts_ui_container.get_child(current_hp+ammount-1-i)
			heart.queue_free()
	took_damage.emit()
	
	if current_hp <= 0:
		alive = false
		has_died.emit()
		invincible = true
		
		
		
