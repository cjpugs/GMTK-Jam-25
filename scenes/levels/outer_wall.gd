extends StaticBody3D

func _ready() -> void:
	var mesh = $OuterWallMesh.mesh
	if mesh and mesh.surface_get_array_count() > 0:
		var arrays = mesh.surface_get_arrays(0)
		if arrays.size() > Mesh.ARRAY_INDEX:
			var indices = arrays[Mesh.ARRAY_INDEX]
			if indices and indices.size() > 0:
				var concave = ConcavePolygonShape3D.new()
				concave.data = indices
				$CollisionShape3D.shape = concave
