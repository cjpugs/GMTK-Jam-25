extends RigidBody3D

func on_lasso_captured() -> void:
	set_process_mode(Node.PROCESS_MODE_DISABLED)

func on_lasso_released() -> void:
	set_process_mode(Node.PROCESS_MODE_INHERIT)
