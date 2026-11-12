extends CharacterBody2D

@onready var start_position: Vector2 = global_position

@export var x_min = 325.0
@export var x_max = 790.0
@export var speed_increment: float = 50.0 
@export var restart_delay: float = 3.0 # 3 Seconds

var speedAdder: float = 0.0
var is_game_over: bool = false

# Start reset_position during the first initialization	
func _ready() -> void: 
	reset_position.call_deferred(false)

func _physics_process(delta: float) -> void:
	if is_game_over or get_tree().paused:
		return
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	move_and_slide()

func reset_position() -> void:
	var random_x: float = randf_range(x_min, x_max)
	
	var root = get_tree().current_scene as MainScene
	if root:
		root.global_enemy_x_pos = random_x
		root.enemy_x_pos_reset.emit(random_x)
	
	global_position = Vector2(random_x, start_position.y)
	speedAdder += speed_increment
	velocity = Vector2(0.0, speedAdder)
	
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player") and not is_game_over:
		trigger_game_over()
	
func trigger_game_over() -> void:
	is_game_over = true
	
	get_tree().paused = true
	
	await get_tree().create_timer(restart_delay, true).timeout
	
	get_tree().paused = false
	get_tree().reload_current_scene()
