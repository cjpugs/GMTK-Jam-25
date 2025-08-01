extends Node3D

const LASSO = preload("res://scenes/lasso/lasso.tscn")
var lasso_thrown := false;

func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("charge_lasso"):
		if lasso_thrown:
			$"Lasso-line".generate_line = false
			$Lasso.cleanup()
			lasso_thrown = false;
		else: # Throw Lasso
			var lasso = LASSO.instantiate()
			add_child(lasso)
			lasso.global_transform = global_transform
			lasso.launch()
			$"Lasso-line".endpoint = lasso.get_child(0)
			$"Lasso-line".generate_line = true
			lasso_thrown = true;
		
		
		
