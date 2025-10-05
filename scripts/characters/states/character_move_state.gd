extends CharacterState

func _physics_update_state(delta: float) -> void:
	var will_move: bool = character.move_direction != Vector2.ZERO
	var desired_velocity = character.move_direction * character.speed
	if character.velocity.length() < character.speed and will_move:
		character.velocity = lerp(character.velocity, desired_velocity, character.acceleration * delta)
	else:
		character.velocity = lerp(character.velocity, desired_velocity, character.velocity_steer_factor_on_move * delta)
	
	
	character.move_and_slide()

func _on_character_signal(command: StringName):
	if(command == 'dash'):
		transitioned.emit(self, 'dash')
	


func _on_player_pickup(item: Item) -> void:
	character.set_item(item.item_name, item)
