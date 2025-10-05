extends RigidBody2D
class_name Item

@export var item_name: StringName = 'item'

func is_item_pickable() -> bool:
	return true
