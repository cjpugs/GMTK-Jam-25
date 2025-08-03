extends Node3D

const LASSO = preload("res://scenes/lasso/lasso.tscn")
var lasso_node = null;
var lasso_thrown := false;

func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("charge_lasso"):
		if lasso_thrown:
			$"Lasso-line".generate_line = false
			
			#if $Lasso.something_caught:
				#$Lasso.
			
			lasso_node.cleanup()
	
			lasso_thrown = false;
		else: # Throw Lasso
			lasso_node = LASSO.instantiate()
			add_child(lasso_node)
			lasso_node.global_transform = global_transform
			lasso_node.launch()
			$"Lasso-line".endpoint = lasso_node.get_child(0)
			$"Lasso-line".generate_line = true
			lasso_thrown = true;
			
