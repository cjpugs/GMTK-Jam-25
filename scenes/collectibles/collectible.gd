extends Area3D

@export var point_value := 100 # placeholder default score
@export var mesh_override: Mesh

func _ready() -> void:
	if mesh_override:
		$MeshInstance3D.mesh = mesh_override

func _on_body_entered(body: Node3D) -> void:
	Globals.score += point_value
	queue_free()
