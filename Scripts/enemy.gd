extends CharacterBody2D

@onready var start_position: Vector2 = global_position

@export var x_min = 325.0
@export var x_max = 790.0
@export var speed_increment: float = 50.0 

var speedAdder: float = 0.0

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	move_and_slide()

func reset_position() -> void:
	var random_x: float = randf_range(x_min, x_max)
	
	global_position = Vector2(random_x, start_position.y)
	speedAdder += speed_increment
	velocity = Vector2(0.0, speedAdder)
	
