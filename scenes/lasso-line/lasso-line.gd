@tool
extends MeshInstance3D

@export var endpoint: Node3D
@export var debug_generate: bool:
	get: return false
	set(value): _generate(value)
@export var offset: Vector3 = Vector3.UP
@export var thickness: float = 0.1
@export var points: int = 3

var generate_line: bool = false:
	set(value):
		if !value: mesh.clear_surfaces()
		generate_line = value

func _generate(value) -> void:
	if value:
		print("Generating Line...")
		update(endpoint.global_position)

func _physics_process(_delta: float) -> void:
	if generate_line:
		update(endpoint.global_position)
	
func update(target: Vector3) -> void:
	var start: Vector3 = global_position
	var end: Vector3 = target
	
	var trail: Vector3 = end - start
	var direction: Vector3 = trail.normalized()
	var distance: float = trail.length()
	
	var dir90: Vector3 = direction.slide(Vector3.UP).rotated(Vector3.UP, TAU/4)
	var width: Vector3 = thickness * dir90
	
	# Redraw mesh
	mesh.clear_surfaces()
	mesh.surface_begin(Mesh.PRIMITIVE_TRIANGLE_STRIP)
	
	for i in range(0, points + 1):
		var x: float = float(i) / float(points)
		var d: Vector3 = (x * distance) * direction
		
		mesh.surface_set_normal(Vector3.UP)
		mesh.surface_set_uv(Vector2(1.0, x))
		mesh.surface_add_vertex(d - width)
		
		mesh.surface_set_normal(Vector3.UP)
		mesh.surface_set_uv(Vector2(0.0, x))
		mesh.surface_add_vertex(d + width)
		
	mesh.surface_end()
