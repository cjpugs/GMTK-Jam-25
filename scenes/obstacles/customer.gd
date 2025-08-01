extends CharacterBody3D

@export var gravity_enabled : bool = false
@export var gravity = 10


func _physics_process(delta: float) -> void:
	if gravity_enabled:
		if not is_on_floor():
			velocity.y -= gravity * delta
			move_and_slide()
		
		else:
			print("Crash!")
			queue_free()


func enable_gravity():
	gravity_enabled = true
