extends RigidBody3D

@export var point_value := 100 # placeholder default score
@export var mesh_override: Mesh
@export_enum("Laptop") var collectible_type: String

func _ready() -> void:
	if mesh_override:
		$MeshInstance3D.mesh = mesh_override
	
	var scene_path := ""
	match collectible_type:
		"Laptop": scene_path = "res://scenes/collectibles/laptop.tscn"
	
	if scene_path != "":
		var new_model = load(scene_path).instantiate()
		$Model.queue_free()
		add_child(new_model)
		new_model.name = "Model"

func _on_body_entered(_body: Node3D) -> void:
	Globals.score += point_value
	queue_free()

# Returns RigidBody3D security guard copy
func enter_lassoed_state(lasso: RigidBody3D) -> RigidBody3D:
	return self

func exit_lassoed_state() -> void:
	pass