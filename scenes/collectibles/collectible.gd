extends RigidBody3D

# Returns RigidBody3D security guard copy
func enter_lassoed_state(lasso: RigidBody3D) -> RigidBody3D:
	return self

func exit_lassoed_state() -> void:
	pass
