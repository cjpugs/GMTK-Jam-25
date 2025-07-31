extends CharacterBody3D

var speed : int = 10
@onready var nav_agent = $NavigationAgent3D

func _physics_process(delta: float) -> void:
	var current_location : Vector3 = global_position
	var next_location : Vector3 = nav_agent.get_next_location()
	var new_velocity : Vector3 = (next_location - current_location) * speed * delta
	
	velocity = new_velocity
	move_and_slide()

func update_target_location(target_location):
	nav_agent.set_target_location(target_location)
