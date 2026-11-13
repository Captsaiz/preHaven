extends CharacterBody2D

const MAX_SPEED = 500.0   # The top speed your character can reach
const ACCELERATION = 20.0 # How fast you speed up each frame
const FRICTION = 5.0     # How fast you slow down when keys are released

var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta: float) -> void:
	# 1. Gravity Handler
	if not is_on_floor():
		velocity.y += gravity * delta
	
	# 2. Movement Handler
	var direction := Input.get_axis("ui_left", "ui_right")
	
	if direction:
		# Accelerate toward your target velocity (direction * max speed)
		var target_velocity = direction * MAX_SPEED
		velocity.x = move_toward(velocity.x, target_velocity, ACCELERATION)
	else:
		# Smoothly brake down to 0 using friction
		velocity.x = move_toward(velocity.x, 0, FRICTION)

	# 3. Physics Execution
	move_and_slide()
