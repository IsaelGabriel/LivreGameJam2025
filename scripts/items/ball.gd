extends Item

@export var max_pickup_velocity: float = 20.0

func is_item_pickable() -> bool:
	return linear_velocity.length() <= max_pickup_velocity
