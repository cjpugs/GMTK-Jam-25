extends Area3D


func _on_body_entered(body: Node3D) -> void:
	Globals.score += 1 # placeholder score increment
