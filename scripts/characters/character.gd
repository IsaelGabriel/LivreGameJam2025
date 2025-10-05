extends CharacterBody2D
class_name Character

signal character_signal(command: StringName)

@export var speed: float = 20
@export var acceleration: float = 1.0
@export var velocity_steer_factor_on_move: float = 1.0

var move_direction: Vector2 = Vector2.ZERO
