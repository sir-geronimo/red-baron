class_name Bullet
extends Node2D

@export var speed: float = 700.0
@export var direction: Vector2 = Vector2.UP

@onready var visible_on_screen_notifier_2d: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D

func _ready() -> void:
	visible_on_screen_notifier_2d.connect("screen_exited", queue_free)

func _physics_process(delta) -> void:
	var velocity = direction * speed
	self.position += velocity * delta
