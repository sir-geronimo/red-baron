extends Control

@export var game_stats: GameStats

@onready var restart_button: Button = %RestartButton
@onready var score_value_label: Label = %ScoreValueLabel
@onready var high_score_value_label: Label = %HighScoreValueLabel

func _ready() -> void:
	restart_button.connect("pressed", goto_menu)
	update_score()

func _process(_delta) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		goto_menu()

func goto_menu() -> void:
	game_stats.score = 0.0
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func update_score() -> void:
	if game_stats.score >= game_stats.highscore:
		game_stats.highscore = game_stats.score
	
	score_value_label.text = str(game_stats.score)
	high_score_value_label.text = str(game_stats.highscore)
