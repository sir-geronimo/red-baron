class_name Player
extends CharacterBody2D

@export var gun: Gun

func _physics_process(_delta):
	# Handle shooting
	var shooting := Input.is_action_pressed("shoot")
	if shooting and gun.timer.is_stopped():
		gun.shoot()
