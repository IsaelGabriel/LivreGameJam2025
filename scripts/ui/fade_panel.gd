extends Panel

@export var duration: float = 0.2

var timer: Timer

func _ready() -> void:
	visible = true
	timer = Timer.new()
	timer.timeout.connect(_on_timer_timeout)
	add_child(timer)
	timer.start(duration)
	
func _process(_delta: float) -> void:
	modulate.a = lerpf(0.0, 1.0, timer.time_left / duration)
	
func _on_timer_timeout() -> void:
	timer.stop()
	queue_free()
