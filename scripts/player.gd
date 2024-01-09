class_name Player
extends Node2D

@export var gun: Gun

@onready var health_component: HealthComponent = $Components/HealthComponent
@onready var hitbox_component: HitBoxComponent = $HitBoxComponent

func _ready() -> void:
	hitbox_component.hit.connect(func (hurtbox: HurtBoxComponent):
		health_component.take_damage(hurtbox.attack_component.damage)
	)

func _physics_process(_delta):
	# Handle shooting
	var shooting := Input.is_action_pressed("shoot")
	if shooting and gun.timer.is_stopped():
		gun.shoot()
