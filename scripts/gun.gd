class_name Gun
extends Node2D

@export var attack_component: AttackComponent
@export var bullet_entity: PackedScene

@onready var muzzle: Marker2D = $Muzzle
@onready var timer: Timer = $Timer

func shoot():
	if timer.is_stopped():
		timer.start()
		var bullet = bullet_entity.instantiate()
		get_tree().root.add_child(bullet)
		bullet.position = muzzle.global_position
