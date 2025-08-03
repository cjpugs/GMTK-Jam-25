extends Control

func _ready() -> void:
	get_tree().set_input_as_handled()

func _on_play_pressed() -> void:
	TransitionScreen.change_scene("res://scenes/levels/test-level.tscn")


func _on_credits_pressed() -> void:
	TransitionScreen.change_scene("res://scenes/user-interface/credits.tscn")


func _on_quit_pressed() -> void:
	get_tree().quit()
