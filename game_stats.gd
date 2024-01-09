class_name GameStats
extends Resource

signal score_changed(new_score: int)

@export var highscore: int = 0
@export var score: int = 0:
	set(value):
		score = value
		score_changed.emit(value)
