extends Character

func _on_damageable_took_damage() -> void:
	character_signal.emit('damage')


func _on_damageable_has_died() -> void:
	get_tree().change_scene_to_file("res://scenes/game_won.tscn")
