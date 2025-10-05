extends Character

func _on_damageable_took_damage() -> void:
	character_signal.emit('damage')
