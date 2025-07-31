extends CharacterBody3D

func enable_grav():
	print("gravity enabled")
@export var gravity_enabled : bool = false
@export var gravity = 10

func _physics_process(delta: float) -> void:
	if gravity_enabled and not is_on_floor():
		velocity.y -= gravity * delta
		move_and_slide()


func enable_gravity():
	gravity_enabled = true
