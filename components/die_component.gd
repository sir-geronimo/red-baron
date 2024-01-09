class_name DieComponent
extends Node

signal died

@export var actor: Node2D
@export var health_component: HealthComponent
@export var dead_effect_spawner_component: SpawnerComponent 

func _ready() -> void:
	health_component.no_health.connect(die)

func die() -> void:
	dead_effect_spawner_component.spawn()
	died.emit()
	actor.queue_free()
