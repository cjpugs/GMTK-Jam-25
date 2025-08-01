extends RigidBody3D

@export var direction = Vector3(0, 1, -2)
@export var impulse_amount := 15.0
var something_caught = false;

func _enter_tree() -> void:
	contact_monitor = true
	max_contacts_reported = 5
	
func _on_body_entered(body: PhysicsBody3D) -> void:
	if body.has_method("on_lasso_captured") && !something_caught:
		call_deferred("attach_to_object", body)
		
func attach_to_object(node: Node) -> void:
	if node.has_method("on_lasso_captured") && !something_caught:
		something_caught = true
		get_parent().remove_child(self)
		node.add_child(self)	# Add self as body's child
		global_position = node.get_child(0).global_position
		global_rotation = Vector3.ZERO
		self.set_freeze_enabled(true)
		node.on_lasso_captured()

func launch() -> void:
	var target_direction = basis * direction.normalized()
	var target_impulse = target_direction * impulse_amount
	apply_impulse(target_impulse)

func cleanup() -> void:
	if get_parent().has_method("on_lasso_released"):
		get_parent().on_lasso_released()
	queue_free()
