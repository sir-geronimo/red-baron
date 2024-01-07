class_name HurtBoxComponent
extends Area2D

@export var attack_component: AttackComponent
@export var health_component: HealthComponent

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	#self.connect("body_entered", _on_body_entered)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta) -> void:
	pass

#func _on_body_entered(body: Node2D) -> void:
	#print(body.name)
