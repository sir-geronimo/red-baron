class_name MoveComponent
extends Node

@export var actor: Node2D

#@export_group("Statistics")
@export var speed: float = 100.0
@export var velocity: Vector2 = Vector2.ZERO

func _physics_process(delta: float) -> void:
	actor.position += velocity * speed * delta
