extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5

@onready var floor_detector = $RayCast3D

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not floor_detector.is_colliding():
		velocity += get_gravity() * delta
	else:
		velocity.y = 0

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("robot_left", "robot_right", "robot_foward", "robot_backward")
	var input_rot := Input.get_axis("robot_ccw", "robot_cw")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	
	rotate(Vector3(0, 1, 0), input_rot * 0.1)

	move_and_slide()
