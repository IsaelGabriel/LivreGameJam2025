extends Node


@export var wait: float = 3.0
@export var next_scene: PackedScene
@export var text: Control

var timer: Timer
var t: float
var sine_speed = 1.5

func _ready() -> void:
	text.visible = false
	timer = Timer.new()
	timer.timeout.connect(_on_timer_timeout)
	add_child(timer)
	timer.start(wait)

func _process(delta: float) -> void:
	t += delta
	text.modulate.a = sin(t * sine_speed) ** 2

func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.is_pressed() and timer.is_stopped():
		get_tree().change_scene_to_packed(next_scene)

func _on_timer_timeout() -> void:
	timer.stop()
	text.visible = true
