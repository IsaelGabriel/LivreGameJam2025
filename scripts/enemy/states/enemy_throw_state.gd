extends CharacterState

@export var throw_force: float = 250.0
@export var target: Node2D
@export var ball_prefab: PackedScene

func _enter_state() -> void:
	var ball: Ball = ball_prefab.instantiate()
	ball.position = character.position
	ball.set_team('enemy')
	get_tree().current_scene.add_child(ball)
	ball.linear_velocity = (target.position - character.position).normalized() * throw_force
	transitioned.emit(self, 'wait')
