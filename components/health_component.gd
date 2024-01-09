class_name HealthComponent
extends Node

signal health_changed(previous: float, new: float)
signal no_health

@export var max_health: float = 100.0

var health: float = max_health:
	set = set_health

func set_health(value: float) -> void:
	health_changed.emit(health, value) 
	health = clamp(value, 0.0, max_health)

	if is_dead():
		no_health.emit()

func is_dead() -> bool:
	return health <= 0
