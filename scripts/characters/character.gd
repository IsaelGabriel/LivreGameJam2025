extends CharacterBody2D
class_name Character

signal character_signal(command: StringName)
signal pickup(item: Item)

@export var face: Node2D
@export var face_weight: float = 1.0
@export var face_speed: float = 1.0
@export var hands: Node2D
@export var hands_weight: float = 1.0
@export var hands_speed: float = 1.0
@export var item: StringName = ''
@export var animator: AnimationPlayer

var move_direction: Vector2 = Vector2.ZERO
var face_default_position: Vector2
var hands_default_position: Vector2

func _ready():
	face_default_position = face.position
	hands_default_position = hands.position
	set_item(item)

func _process(delta: float) -> void:
	face.position = lerp(face.position, face_default_position + velocity * 0.01 * face_weight, delta * face_speed)
	hands.position = lerp(hands.position, hands_default_position - velocity * 0.01 * hands_weight, delta * hands_speed)

func set_item(item_name: StringName, item_body: Item = null) -> void:
	self.item = item_name
	if item_name.is_empty():
		animator.play('idle')
	else:
		animator.play('with_item')
		if item_body != null:
			item_body.queue_free()
	
