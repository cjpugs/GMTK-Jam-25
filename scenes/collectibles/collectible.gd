extends RigidBody3D

# Returns RigidBody3D security guard copy
func enter_lassoed_state(lasso: RigidBody3D) -> RigidBody3D:
	return self

func on_lasso_released() -> void:
	set_process_mode(Node.PROCESS_MODE_INHERIT)
