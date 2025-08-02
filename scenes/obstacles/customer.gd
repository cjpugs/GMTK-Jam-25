extends CharacterBody3D

@export var gravity_enabled : bool = false
@export var gravity = 10


var customer_data : Customer_Data

func _ready() -> void:
	customer_data = Customer_Data.new()
	
	var headColor : Color = customer_data.get_head_color()
	var bodyColor : Color = customer_data.get_body_color()
	
	var new_head_material = $Body/Head.mesh.material.duplicate()
	var new_body_material = $Body/Head.mesh.material.duplicate()
	
	new_head_material.albedo_color = headColor
	new_body_material.albedo_color = bodyColor
	
	$Body/Head.material_override = new_head_material
	$Body.material_override = new_body_material
	

func _physics_process(delta: float) -> void:
	if gravity_enabled:
		if not is_on_floor():
			velocity.y -= gravity * delta
			move_and_slide()
		
		else:
			print("Crash!")
			queue_free()


func enable_gravity():
	gravity_enabled = true
