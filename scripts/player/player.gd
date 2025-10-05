extends Character
class_name Player

func _process(_delta: float) -> void:
	move_direction = Input.get_vector("p_left", "p_right", "p_up", "p_down")
