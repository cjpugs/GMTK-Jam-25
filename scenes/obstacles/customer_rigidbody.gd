extends RigidBody3D

const CUSTOMER = preload("res://scenes/obstacles/customer.tscn")
var lasso_released = false

func _integrate_forces(state: PhysicsDirectBodyState3D) -> void:
	if lasso_released:
		for i in state.get_contact_count():
			var normal := state.get_contact_local_normal(i)
			if normal.dot(Vector3.UP) > 0.90: # If contact is mostly upright (likely a floor)
				despawn()
				break

func despawn() -> void:
	var customer = CUSTOMER.instantiate()
	customer.global_transform = global_transform
	queue_free()


func exit_lassoed_state() -> void:
	lasso_released = true
