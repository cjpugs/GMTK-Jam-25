extends Area3D

@export var point_value := 100 # placeholder default score

func _on_body_entered(body: Node3D) -> void:
	Globals.score += point_value
	queue_free()
