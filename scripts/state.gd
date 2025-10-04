extends Node
class_name State

signal transitioned(from: State, to: StringName)

func _enter_state() -> void:
	pass

func _exit_state() -> void:
	pass

func _update_state(_delta: float) -> void:
	pass
	
func _physics_update_state(_delta: float) -> void:
	pass
