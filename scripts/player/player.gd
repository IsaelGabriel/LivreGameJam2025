extends Character
class_name Player

func _process(delta: float) -> void:
	super._process(delta)
	move_direction = Input.get_vector("p_left", "p_right", "p_up", "p_down")
	
	if Input.is_action_just_pressed("p_dash"):
		character_signal.emit('dash')


func _on_pickup_area_body_entered(body: Node2D) -> void:
	if body is Item and item.is_empty():
		if body.is_item_pickable():
			pickup.emit(body)
