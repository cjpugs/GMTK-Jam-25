extends CanvasLayer

func _ready() -> void:
	$GridContainer/ScoreAmount.text = str(Globals.score)
	$GridContainer/ItemsAmount.text = str(Globals.items_grabbed)

func _on_play_again_pressed() -> void:
	print("Send to play again")


func _on_main_menu_pressed() -> void:
	print("Send to main menu")


func _on_quit_pressed() -> void:
	print("Quitting game")
	get_tree().quit()
