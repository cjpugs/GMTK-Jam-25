extends CanvasLayer

func _ready() -> void:
	$GridContainer/ScoreAmount.text = str(Globals.score)
	$GridContainer/ItemsAmount.text = str(Globals.items_grabbed)

func _on_play_again_pressed() -> void:
	TransitionScreen.change_scene("res://scenes/levels/test-level.tscn")


func _on_main_menu_pressed() -> void:
	TransitionScreen.change_scene("res://scenes/user-interface/main_menu.tscn")


func _on_quit_pressed() -> void:
	print("Quitting game")
	get_tree().quit()
