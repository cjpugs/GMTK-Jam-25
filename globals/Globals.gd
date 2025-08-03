extends Node

signal stat_change()
signal lasso_caught_object(object: RigidBody3D)

var score : int = 0:
	set(val):
		score = val
		stat_change.emit()

var items_grabbed : int = 0

func _enter_tree() -> void:
	lasso_caught_object.connect(_on_lasso_caught_object)

func _on_lasso_caught_object(object: RigidBody3D):
	var player := $"../Test-level/Player"
	player.setup_lasso_mode(object)
