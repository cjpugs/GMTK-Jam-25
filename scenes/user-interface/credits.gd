extends Control

func _ready() -> void:
	pass
	


func _on_button_pressed() -> void:
	TransitionScreen.change_scene("res://scenes/user-interface/main_menu.tscn")
