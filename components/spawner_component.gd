class_name SpawnerComponent
extends Node2D

@export var scene: PackedScene

func spawn(spawn_position: Vector2 = global_position, parent: Node = get_tree().current_scene) -> Node2D:
	var instance = scene.instantiate()
	parent.add_child(instance)
	instance.global_position = spawn_position
	
	return instance
