extends Camera2D

@onready var start_position: Vector2 = position

@export var random_strength: float = 30.0
@export var shake_fade: float = 5.0

var shake_strength: float = 0.0
var shake: bool = false

func start_shake(fade: float):
	shake = true
	randomize()
	shake_strength = random_strength
	shake_fade = fade

func _process(delta: float) -> void:
	if not shake: return
	shake_fade -= delta

	offset = random_offset()
	
	if shake_fade <= 0.0:
		shake_fade = 0.0
		shake = false
		offset = Vector2.ZERO
	
func random_offset() -> Vector2:
	return Vector2(randf_range(-shake_strength, shake_strength), randf_range(-shake_strength, shake_strength))
