class_name MoveClampComponent
extends Node

@export var actor: Node2D

var max_width: float = ProjectSettings.get_setting("display/window/size/viewport_width")
var max_height: float = ProjectSettings.get_setting("display/window/size/viewport_height")

func _physics_process(_delta: float) -> void:
	actor.position = actor.position.clamp(Vector2.ZERO, Vector2(max_width, max_height))
