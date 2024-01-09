extends Control

@onready var play_button: Button = %PlayButton
@onready var quit_button: Button = %QuitButton

func _ready() -> void:
	play_button.connect("pressed", start)
	quit_button.connect("pressed", quit)

func _process(_delta) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		start()

func start() -> void:
	get_tree().change_scene_to_file("res://scenes/world.tscn")

func quit() -> void:
	get_tree().quit()
