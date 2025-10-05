extends CharacterBody2D
class_name Character

signal character_signal(command: StringName)

@export var speed: float = 20
@export var acceleration: float = 1.0
@export var velocity_steer_factor_on_move: float = 1.0
@export var face: Node2D
@export var face_weight: float = 1.0
@export var face_speed: float = 1.0
@export var hands: Node2D
@export var hands_weight: float = 1.0
@export var hands_speed: float = 1.0


var move_direction: Vector2 = Vector2.ZERO
var face_default_position: Vector2
var hands_default_position: Vector2

func _ready():
	face_default_position = face.position
	hands_default_position = hands.position

func _process(delta: float):
	face.position = lerp(face.position, face_default_position + velocity * 0.01 * face_weight, delta * face_speed)
	hands.position = lerp(hands.position, hands_default_position - velocity * 0.01 * hands_weight, delta * hands_speed)
