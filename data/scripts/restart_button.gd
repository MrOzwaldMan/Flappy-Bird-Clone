extends Button


func _on_pressed():
	Game.is_game_lost = false
	get_tree().reload_current_scene()
