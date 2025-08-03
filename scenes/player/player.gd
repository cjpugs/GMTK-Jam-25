extends CharacterBody3D

@export var speed = 14	# How fast the player moves in meters per second
@export var fall_acceleration = 75 # Downward air acceleration in meters per second squared
@export var look_sensitivity = 0.01 # Sensitivity of mouse look movement

var target_velocity = Vector3.ZERO
var lasso_mode = false
var target_look_at: RigidBody3D = null

@onready var neck := $Neck
@onready var camera := $Neck/Camera3D

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	elif event.is_action_pressed("pause"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
	if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		if event is InputEventMouseMotion:
			if lasso_mode:
				var look_vector = Vector3(event.relative.x, event.relative.y, 0.0)
				var angle = abs(global_rotation.y - target_look_at.global_rotation.y)
				if angle > 180.0:
					angle = 360.0 - angle
				look_vector = look_vector.rotated(Vector3.UP, deg_to_rad(angle))
				target_look_at.apply_force(look_vector)
			else:
				neck.rotate_y(-event.relative.x * look_sensitivity)
				camera.rotate_x(-event.relative.y * look_sensitivity)
				camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-30), deg_to_rad(60))

func _physics_process(delta) -> void:
	if lasso_mode:
		camera.look_at(target_look_at.global_position)
	
	var direction = Vector3.ZERO
	
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	if Input.is_action_pressed("move_right"):
		direction.x += 1
	if Input.is_action_pressed("move_forward"):
		direction.z -= 1
	if Input.is_action_pressed("move_back"):
		direction.z += 1
	
	if direction != Vector3.ZERO:
		direction = neck.transform.basis * direction.normalized()
		
	target_velocity.x = direction.x * speed
	target_velocity.z = direction.z * speed
	
	if not is_on_floor():
		target_velocity.y = target_velocity.y - (fall_acceleration * delta)
	
	velocity = target_velocity
	move_and_slide()
	
func setup_lasso_mode(object: RigidBody3D) -> void:
	lasso_mode = true
	target_look_at = object
	
func disable_lasso_mode() -> void:
	lasso_mode = false
	target_look_at = null
