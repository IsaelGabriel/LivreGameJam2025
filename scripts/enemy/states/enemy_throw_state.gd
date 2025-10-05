extends CharacterState

@export var throw_force: float = 250.0
@export var throw_offset: float = 32.0
@export var target: Node2D
@export var ball_prefab: PackedScene

func _enter_state() -> void:
	randomize()
	var ball: Ball = ball_prefab.instantiate()
	var throw_direction = (target.position - character.position).normalized()
	ball.set_team('enemy')
	ball.set_item(character.item)
	ball.position = character.position + throw_direction * throw_offset
	get_tree().current_scene.add_child(ball)
	ball.linear_velocity = throw_direction * throw_force
	character.set_item(ItemManager.items.keys()[randi() % 4])
	
	
	transitioned.emit(self, 'wander')
