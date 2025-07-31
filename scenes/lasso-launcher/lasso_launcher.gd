extends Node3D

const LASSO = preload("res://scenes/lasso/lasso.tscn")

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("charge_lasso"):
		var lasso = LASSO.instantiate()
		add_child(lasso)
		lasso.global_transform = global_transform
