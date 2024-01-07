extends Node

@onready var button: Button = $UI/Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	button.connect("pressed", func():
		get_tree().change_scene_to_file("res://scenes/world.tscn")
	)
