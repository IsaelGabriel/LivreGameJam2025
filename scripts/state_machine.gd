extends Node
class_name StateMachine

@export var initial_state : State

var states : Dictionary = {}
var current_state : State

func _ready():
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.transitioned.connect(_on_child_transitioned)
	
	if initial_state:
		current_state = initial_state
		current_state._enter_state()

func _process(delta: float) -> void:
	if current_state:
		current_state._update_state(delta)

func _physics_process(delta: float) -> void:
		if current_state:
			current_state._physics_update_state(delta)

func _on_child_transitioned(from: State, to: StringName):
	if from != current_state:
		return
	
	var new_state = states.get(to.to_lower())
	if !new_state:
		return
	
	if current_state:
		current_state._exit_state()
	
	current_state = new_state
	current_state._enter_state()
	
