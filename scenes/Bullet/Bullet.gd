class_name Bullet
extends CharacterBody2D

@export var speed: float = 700.0

func _physics_process(delta):
	self.velocity = Vector2.UP * speed
	
	move_and_slide()
