extends StaticBody2D

@onready var root := get_tree().current_scene as MainScene

func _ready() -> void:
	if root:
		root.enemy_x_pos_reset.connect(_on_enemy_x_pos_reset)

func _on_enemy_x_pos_reset(new_x: float) -> void:
	global_position = Vector2(new_x, 255)
	


# func _on_area_2d_body_entered(body: Node2D) -> void:
	
