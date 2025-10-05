extends CharacterState

@export var time = 1.0
@export var next_state: StringName = 'wait'

var timer: Timer

func _enter_state() -> void:
	if not timer:
		timer = Timer.new()
		timer.timeout.connect(_on_timer_timeout)
		add_child(timer)
	timer.start(time)
		
func _on_timer_timeout() -> void:
	transitioned.emit(self, next_state)
