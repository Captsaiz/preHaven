class_name MainScene
extends Node2D

signal enemy_x_pos_reset(new_x: float)

var global_enemy_x_pos: float = 0.0


# score global fucntion
var score: int = 0

func change_score(change_score: int):
	score += change_score
	$UI/MarginContainer/score.update_score(score)
