extends CanvasLayer


func _on_play_pressed() -> void:
	TransitionScreen.change_scene("res://scenes/levels/test-level.tscn")


func _on_quit_pressed() -> void:
	print("Quitting game")
	get_tree().quit()


func _on_credits_pressed() -> void:
	print("send to credits")
