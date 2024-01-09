class_name HitBoxComponent
extends Area2D

signal hit(hurtbox: HurtBoxComponent)

func _ready() -> void:
	area_entered.connect(_on_hurtbox_entered)

func _on_hurtbox_entered(hurtbox: HurtBoxComponent) -> void:
	if not hurtbox is HurtBoxComponent:
		return

	hit.emit(hurtbox)
	hurtbox.hurt.emit(self)
