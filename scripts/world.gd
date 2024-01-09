extends Node

@export var game_stats: GameStats

@onready var player: Player = $Player
@onready var score_label: Label = $Score

func _ready() -> void:
	randomize()
	update_score(game_stats.score)
	game_stats.score_changed.connect(update_score)
	
	# FIXME: Crashes when closing via the window's "X" button
	player.tree_exited.connect(func ():
		await get_tree().create_timer(1.0).timeout
		get_tree().change_scene_to_file("res://scenes/game_over.tscn")
	)

func update_score(new_score: int) -> void:
	score_label.text = "Score: " + str(new_score)
