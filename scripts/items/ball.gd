extends Item
class_name Ball

@export var max_pickup_velocity: float = 20.0

func _process(_delta: float) -> void:
	modulate = lerp(Color.WHITE, Color.RED, (linear_velocity.length() - max_pickup_velocity) / max_pickup_velocity)

func is_item_pickable() -> bool:
	return linear_velocity.length() <= max_pickup_velocity

func set_team(team: StringName):
	match team:
		'player':
			set_collision_layer_value(1, false)
			set_collision_layer_value(2, true)
		'enemy':
			set_collision_layer_value(1, true)
			set_collision_layer_value(2, false)
	


func _on_body_entered(body: Node) -> void:
	if body is Character:
		var damageable: Damageable = body.get_node('Damageable')
		if damageable and not damageable.invincible and linear_velocity.length() >= max_pickup_velocity:
			damageable.take_damage()
			damageable.knockback.emit((body.position - position).normalized())
			queue_free()
			
