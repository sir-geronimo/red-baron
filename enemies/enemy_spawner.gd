extends Node2D

const ScreenMargin: float = 5.0

@export var game_stats: GameStats

@export_group("Enemies")
@export var small_enemy_scene: PackedScene
@export var medium_enemy_scene: PackedScene
@export var big_enemy_scene: PackedScene

@onready var spawner_component: SpawnerComponent = $SpawnerComponent
@onready var small_enemy_timer: Timer = $SmallEnemyTimer
@onready var medium_enemy_timer: Timer = $MediumEnemyTimer
@onready var big_enemy_timer: Timer = $BigEnemyTimer

var max_width: float = ProjectSettings.get_setting("display/window/size/viewport_width")

func _ready() -> void:
	small_enemy_timer.timeout.connect(spawn_enemy.bind(small_enemy_scene, small_enemy_timer))
	medium_enemy_timer.timeout.connect(spawn_enemy.bind(medium_enemy_scene, medium_enemy_timer), 2.0)
	big_enemy_timer.timeout.connect(spawn_enemy.bind(big_enemy_scene, big_enemy_timer), 8.0)

func spawn_enemy(enemy_scene: PackedScene, timer: Timer, time_offset: float = 1.0) -> void:
	spawner_component.scene = enemy_scene
	var enemy_instance = spawner_component.spawn(
		Vector2(randf_range(ScreenMargin, max_width), -ScreenMargin)
	)
	enemy_instance.rotate(PI)
	var spawn_rate = time_offset / (0.5 + (game_stats.score * 0.01))
	timer.start(spawn_rate + randf_range(0.1, 1.0))
