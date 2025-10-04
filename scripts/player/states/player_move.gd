extends State

var movement_input: Vector2
@export var player : Player

func _update_state(_delta: float) -> void:
	_handle_input()
	
func _handle_input():
	movement_input = Input.get_vector("p_left", "p_right", "p_up", "p_down")

func _physics_update_state(_delta: float) -> void:
	player.velocity = Vector3(movement_input.x, 0, movement_input.y) * player.SPEED
	
	player.move_and_slide()
