class_name Enemy
extends Node2D

@export var health_component: HealthComponent
@export var attack_component: AttackComponent

@onready var visible_on_screen_notifier_2d: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D
@onready var hitbox_component: HitBoxComponent = $HitBoxComponent
@onready var die_component: DieComponent = $Components/DieComponent
@onready var score_component: ScoreComponent = $Components/ScoreComponent

func _ready() -> void:
	visible_on_screen_notifier_2d.screen_exited.connect(queue_free)
	hitbox_component.hit.connect(func (hurtbox: HurtBoxComponent):
		health_component.take_damage(hurtbox.attack_component.damage)
	)
	die_component.died.connect(score_component.adjust_score)
