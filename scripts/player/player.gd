extends Character
class_name Player

func _process(delta: float) -> void:
	super._process(delta)
	move_direction = Input.get_vector("p_left", "p_right", "p_up", "p_down")
	
	if Input.is_action_just_pressed("p_dash"):
		character_signal.emit('dash')
