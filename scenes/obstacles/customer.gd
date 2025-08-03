extends CharacterBody3D

@export var gravity_enabled : bool = false
@export var gravity = 10
const CUSTOMER_RIGIDBODY = preload("res://scenes/obstacles/customer-rigidbody.tscn")


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

func on_lasso_released() -> void:
	set_process_mode(Node.PROCESS_MODE_INHERIT)

# Instantiates a RigidBody3D carbon copy of the customer, attaches the lasso to it, then kills itself.
# Returns RigidBody3D customer copy
func enter_lassoed_state(lasso: RigidBody3D) -> RigidBody3D:
	var customer_rigidbody = CUSTOMER_RIGIDBODY.instantiate()
	customer_rigidbody.global_transform = global_transform
	if get_parent():
		get_parent().add_child(customer_rigidbody)
	
	queue_free()
	return customer_rigidbody
