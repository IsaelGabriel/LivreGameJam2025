extends CharacterBody3D

# Player state machine

const SPEED = 20

var movement_input: Vector2


func _process(_delta: float) -> void:
	_handle_input()
	
func _handle_input():
	movement_input = Input.get_vector("p_left", "p_right", "p_up", "p_down")

func _physics_process(_delta: float) -> void:
	velocity = Vector3(movement_input.x, 0, movement_input.y) * SPEED
	
	move_and_slide()
