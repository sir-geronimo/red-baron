class_name ScoreComponent
extends Node

@export var game_stats: GameStats
@export var adjust_amount: int = 1

func adjust_score(amount: int = adjust_amount) -> void:
	game_stats.score += amount
