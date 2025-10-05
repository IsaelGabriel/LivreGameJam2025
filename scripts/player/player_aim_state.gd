extends CharacterMoveState

@export var aim_center: Node2D
@export var aim_sprite: Sprite2D

@export var not_ready_texture: Texture2D
@export var ready_texture: Texture2D

@export var time_till_ready: float = 1.0

@export var ball_prefab: PackedScene
@export var item_shoot_force: float = 300.0

var camera: Camera2D
var timer: Timer

func _enter_state() -> void:
	aim_center.visible = true
	camera = get_viewport().get_camera_2d()
	aim_sprite.texture = not_ready_texture
	
	if not timer:
		timer = Timer.new()
		add_child(timer)
		timer.timeout.connect(on_ready_to_shoot)
		timer.autostart = false
	timer.start(time_till_ready)
	aim_sprite.modulate.a = 0


func _update_state(_delta: float) -> void:
	set_aim()
	
	if Input.is_action_just_released("p_aim"):
		shoot()
	
	if not timer.is_stopped():
		aim_sprite.modulate.a = lerp(0.0, 1.0, (time_till_ready - timer.time_left) / time_till_ready)

func set_aim():
	var mouse_pos: Vector2
	if camera:
		mouse_pos = camera.get_global_mouse_position()
	else:
		mouse_pos = get_viewport().get_mouse_position()
	
	aim_center.look_at(mouse_pos)

func shoot() -> void:
	if timer.is_stopped():
		var ball: Ball = ball_prefab.instantiate()
		ball.position = aim_sprite.global_position
		ball.linear_velocity = Vector2.from_angle(aim_center.rotation) * item_shoot_force
		ball.set_team('player')
		get_tree().current_scene.add_child(ball)
		character.set_item('')
	transitioned.emit(self, 'move')

func on_ready_to_shoot() -> void:
	aim_sprite.texture = ready_texture
	aim_sprite.modulate.a = 1
	timer.stop()

func _exit_state() -> void:
	aim_center.visible = false
