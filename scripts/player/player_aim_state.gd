extends CharacterMoveState

@export var aim_center: Node2D

func _enter_state() -> void:
	aim_center.visible = true

func _update_state(_delta: float) -> void:
	if Input.is_action_just_released("p_aim"):
		shoot()

func shoot() -> void:
	# Add shot code here
	transitioned.emit(self, 'move')

func _exit_state() -> void:
	aim_center.visible = false
