extends CharacterBody3D

## Enemy Pathfinding: 10 min tutorial
## https://youtu.be/-juhGgA076E?si=LyneMsTcXfJ_MpzU

var noticing_player : bool = false

@export var speed : int = 200
var curr_speed : int = speed
@onready var nav_agent = $NavigationAgent3D
const SECURITYGUARD_RIGIDBODY = preload("res://scenes/obstacles/security_guard-rigidbody.tscn")


func _physics_process(delta: float) -> void:
	
	if noticing_player:
		var current_location : Vector3 = global_position
		var next_location : Vector3 = nav_agent.get_next_path_position()
		var new_velocity : Vector3 = (next_location - current_location) * curr_speed * delta
		
		nav_agent.set_velocity(new_velocity)
	

func update_target_location(target_location):
	if noticing_player:
		nav_agent.set_target_position(target_location)
		var flat_target_pos = Vector3(target_location.x, global_position.y, target_location.z)
		look_at(flat_target_pos)
		global_rotation.y += deg_to_rad(90)


func _on_navigation_agent_3d_target_reached() -> void:
	print("reached target")


func _on_navigation_agent_3d_velocity_computed(safe_velocity: Vector3) -> void:
	velocity = velocity.move_toward(safe_velocity,0.25)
	if noticing_player:
		move_and_slide()


func _on_notice_area_body_entered(body: Node3D) -> void:
	if body.is_in_group("Player"):
		noticing_player = true
		curr_speed = speed


func _on_notice_area_body_exited(body: Node3D) -> void:
	if body.is_in_group("Player"):
		noticing_player = false
		curr_speed = 0

# Instantiates a RigidBody3D carbon copy of the security guard, attaches the lasso to it, then kills itself.
# Returns RigidBody3D security guard copy
func enter_lassoed_state(lasso: RigidBody3D) -> RigidBody3D:
	var securityguard_rigidbody = SECURITYGUARD_RIGIDBODY.instantiate()
	securityguard_rigidbody.global_transform = global_transform
	if get_parent():
		get_parent().add_child(securityguard_rigidbody)
	queue_free()
	return securityguard_rigidbody

func on_lasso_released() -> void:
	set_process_mode(Node.PROCESS_MODE_INHERIT)
