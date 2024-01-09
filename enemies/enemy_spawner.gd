extends Node2D

const ScreenMargin: float = 5.0

@export var enemies: Array[PackedScene]

@onready var spawner_component: SpawnerComponent = $SpawnerComponent
@onready var timer: Timer = $Timer

var max_width: float = ProjectSettings.get_setting("display/window/size/viewport_width")

func _ready() -> void:
	timer.timeout.connect(func ():
		spawn_enemies()
	)

func spawn_enemies() -> void:
	for enemy in enemies:
		spawner_component.scene = enemy
		var enemy_instance = spawner_component.spawn(
			Vector2(randf_range(ScreenMargin, max_width), -ScreenMargin)
		)
		enemy_instance.rotate(PI)
		timer.start(randf_range(0.75, 5.0))
