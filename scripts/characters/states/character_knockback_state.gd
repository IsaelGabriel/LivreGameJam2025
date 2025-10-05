extends CharacterState

@export var force: float = 200.0
@export var duration: float = 0.5
@export var blink_factor: float = 1.0
@export var next_state: StringName = 'knockback'
@export var damageable: Damageable

var direction: Vector2 = Vector2.ONE
var timer: Timer

func _enter_state() -> void:
	damageable.invincible = true
	timer = Timer.new()
	timer.timeout.connect(_on_timer_timeout)
	add_child(timer)
	timer.start(duration)
	character.velocity = direction * force

func _update_state(_delta: float) -> void:
	character.modulate.a = sin(timer.time_left * blink_factor)

func _physics_update_state(_delta: float) -> void:
	character.move_and_slide()

func _on_damageable_knockback(k_direction: Vector2) -> void:
	direction = k_direction.normalized()

func _on_timer_timeout() -> void:
	character.modulate.a = 1
	damageable.invincible = false
	transitioned.emit(self, next_state)
