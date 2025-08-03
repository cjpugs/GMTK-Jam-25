extends Node3D
class_name Collectible

@export var point_value := 100 # placeholder default score
var collectible_meshes := [BoxMesh, CylinderMesh]

func _ready() -> void:
	var collectible_mesh = collectible_meshes.pick_random()
	$MeshInstance3D.mesh = collectible_mesh.new()
	var mat := StandardMaterial3D.new()
	mat.albedo_color = Color(randf(), randf(), randf())
	$MeshInstance3D.material_override = mat

func _on_body_entered(_body: Node3D) -> void:
	Globals.score += point_value
	queue_free()
