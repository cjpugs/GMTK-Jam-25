extends Control

func _ready() -> void:
	get_tree().set_input_as_handled()
	


func _on_button_pressed() -> void:
	TransitionScreen.change_scene("res://scenes/user-interface/main_menu.tscn")
