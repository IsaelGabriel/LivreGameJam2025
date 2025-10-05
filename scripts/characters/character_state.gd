extends State
class_name CharacterState

@export var character : Character

func _ready() -> void:
	character.character_signal.connect(_on_character_signal)
	
func _on_character_signal(_command: StringName):
	pass
