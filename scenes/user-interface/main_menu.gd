extends CanvasLayer


func _on_play_pressed() -> void:
	print("Send to play")


func _on_quit_pressed() -> void:
	print("Quitting game")
	get_tree().quit()
