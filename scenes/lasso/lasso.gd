extends RigidBody3D

@export var direction = Vector3(0, 1, -2)
@export var impulse_amount := 15.0

func launch() -> void:
	var target_direction = basis * direction.normalized()
	var target_impulse = target_direction * impulse_amount
	apply_impulse(target_impulse)

# If the object hits something, check what it is
# If the object hits a collectable, customer, or security guard, latch onto it

func cleanup() -> void:
	queue_free()
