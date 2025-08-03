extends Control

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _on_play_pressed() -> void:
	TransitionScreen.change_scene("res://scenes/levels/test-level.tscn")


func _on_credits_pressed() -> void:
	TransitionScreen.change_scene("res://scenes/user-interface/credits.tscn")


func _on_quit_pressed() -> void:
	get_tree().quit()
