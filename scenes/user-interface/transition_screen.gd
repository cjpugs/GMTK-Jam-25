extends CanvasLayer

func _ready() -> void:
	$ColorRect.visible = false

func change_scene(target:String) -> void:
	$AnimationPlayer.play("fade-to-black")
	await $AnimationPlayer.animation_finished
	get_tree().call_deferred("change_scene_to_file",target)
	$AnimationPlayer.play_backwards("fade_to_black")
