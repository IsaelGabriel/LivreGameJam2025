extends CharacterState

@export var dash_duration: float = 1.2
@export var dash_speed: float = 400

var dash_timer: Timer
var _dash_direction: Vector2

func _enter_state() -> void:
	if not dash_timer:
		dash_timer = Timer.new()
		dash_timer.timeout.connect(_on_dash_timer_timeout)
		add_child(dash_timer)

	
	dash_timer.start(dash_duration)
	_dash_direction = character.move_direction
	character.velocity = dash_speed * _dash_direction

func _physics_update_state(_delta: float) -> void:
	character.move_and_slide()

func _on_dash_timer_timeout():
	transitioned.emit(self, 'move')
