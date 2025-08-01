extends CharacterBody3D

## Enemy Pathfinding: 10 min tutorial
## https://youtu.be/-juhGgA076E?si=LyneMsTcXfJ_MpzU


var speed : int = 100
@onready var nav_agent = $NavigationAgent3D

func _physics_process(delta: float) -> void:
	var current_location : Vector3 = global_position
	var next_location : Vector3 = nav_agent.get_next_path_position()
	var new_velocity : Vector3 = (next_location - current_location) * speed * delta
	
	nav_agent.set_velocity(new_velocity)
	

func update_target_location(target_location):
	nav_agent.set_target_position(target_location)


func _on_navigation_agent_3d_target_reached() -> void:
	print("reached target")


func _on_navigation_agent_3d_velocity_computed(safe_velocity: Vector3) -> void:
	velocity = velocity.move_toward(safe_velocity,0.25)
	move_and_slide()
