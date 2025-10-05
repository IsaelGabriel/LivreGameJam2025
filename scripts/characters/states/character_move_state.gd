extends CharacterState
class_name CharacterMoveState

@export var speed: float = 350.0
@export var acceleration: float = 50.0
@export var velocity_steer_factor: float = 20.0
@export var can_dash: bool = true

func _update_state(_delta: float) -> void:
	if character is Player and Input.is_action_pressed("p_aim") and character.item == 'ball':
		transitioned.emit(self, 'aim')

func _physics_update_state(delta: float) -> void:
	var will_move: bool = character.move_direction != Vector2.ZERO
	var desired_velocity = character.move_direction * speed
	if character.velocity.length() < speed and will_move:
		character.velocity = lerp(character.velocity, desired_velocity, acceleration * delta)
	else:
		character.velocity = lerp(character.velocity, desired_velocity, velocity_steer_factor * delta)
		
	character.move_and_slide()


func _on_character_signal(command: StringName):
	super._on_character_signal(command)
	match command:
		'dash':
			if can_dash:
				transitioned.emit(self, 'dash')
	
func _on_player_pickup(item: Item) -> void:
	character.set_item(item.item_name, item)
