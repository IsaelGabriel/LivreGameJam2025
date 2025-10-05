extends CharacterMoveState

@export var min_time: float = 1.0
@export var max_time: float = 3.0
@export var next_state_weighted: Dictionary[StringName, float]

var timer: Timer


func _enter_state() -> void:
	randomize()
	character.move_direction = Vector2.from_angle(randf_range(0, 2 * PI))
	if not timer:
		timer = Timer.new()
		timer.timeout.connect(_on_timer_timeout)
		add_child(timer)
	timer.start(randf_range(min_time, max_time))

func _on_timer_timeout() -> void:
	var total = 0
	for weight in next_state_weighted.values():
		total += weight
	
	var value = randf_range(0.0, total)
	var new_state = 'wander'
	
	var current_weight_sum = 0
	for state in next_state_weighted.keys():
		current_weight_sum += next_state_weighted[state]
		if value < current_weight_sum:
			new_state = state
			break
	
	transitioned.emit(self, new_state)
	
