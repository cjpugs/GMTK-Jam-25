extends Control

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	


func _on_button_pressed() -> void:
	TransitionScreen.change_scene("res://scenes/user-interface/main_menu.tscn")
