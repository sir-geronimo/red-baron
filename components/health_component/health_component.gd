class_name HealthComponent
extends Node

signal health_changed(previous, new)
signal no_health

@export var max_health: float = 100.0

var health: float = max_health:
	set = set_health

func _ready() -> void:
	health_changed.connect(_on_health_changed)

func set_health(value: float) -> void:
	health_changed.emit(self.health, value) 
	health = clamp(value, 0.0, self.max_health)
	if self.is_dead():
		no_health.emit()

func is_dead() -> bool:
	return self.health <= 0

func _on_health_changed(previous, new) -> void:
	print("Health changed: ", health)
	health_changed.emit()
