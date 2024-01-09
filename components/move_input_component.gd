class_name MoveInputComponent
extends Node

@export var move_component: MoveComponent

func _physics_process(_delta: float) -> void:
	move_component.velocity = Input.get_vector("left", "right", "up", "down")
