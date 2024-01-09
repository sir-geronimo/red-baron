class_name Enemy
extends CharacterBody2D

@export var health_component: HealthComponent
@export var attack_component: AttackComponent

@onready var visible_on_screen_notifier_2d: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D
@onready var hitbox_component: HitBoxComponent = $HitBoxComponent

func _ready():
	visible_on_screen_notifier_2d.screen_exited.connect(queue_free)
	hitbox_component.hit.connect(func (_hurtbox: HurtBoxComponent):
		print("Ouch")
		queue_free()
	)
