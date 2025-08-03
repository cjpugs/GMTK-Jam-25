extends RigidBody3D

@export var direction = Vector3(0, 1, -2)
@export var impulse_amount := 15.0
var something_caught = false;

func _enter_tree() -> void:
	contact_monitor = true
	max_contacts_reported = 5
	
func _on_body_entered(body: PhysicsBody3D) -> void:
	if body.has_method("enter_lassoed_state") && !something_caught:
		call_deferred("attach_to_object", body)
		
func attach_to_object(node: Node) -> void:
	if node.has_method("enter_lassoed_state") && !something_caught:
		something_caught = true
		
		var lassoed_object = node.enter_lassoed_state(self)
		
		if get_parent():
			get_parent().remove_child(self)
		lassoed_object.add_child(self)
		global_transform = lassoed_object.get_child(0).global_transform
		top_level = false
		$CollisionShape3D.queue_free()
		self.set_freeze_enabled(true)
		
		Globals.lasso_caught_object.emit(lassoed_object)

func launch() -> void:
	var target_direction = basis * direction.normalized()
	var target_impulse = target_direction * impulse_amount
	apply_impulse(target_impulse)

func cleanup() -> void:
	if get_parent().has_method("on_lasso_released"):
		get_parent().on_lasso_released()
	queue_free()
