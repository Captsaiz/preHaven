extends Area2D

@onready var timer: Timer = $Timer
@export var enemy: CharacterBody2D

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		playerFell()
	elif body.is_in_group("Spear"):
		resetSpear(body)
		
func playerFell() -> void:
	timer.start()
	print("You Died")

func resetSpear(Spear: Node2D) -> void:
	if Spear.has_method("reset_position"):
		Spear.reset_position()

func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
