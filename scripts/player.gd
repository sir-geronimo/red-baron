class_name Player
extends CharacterBody2D

#region Exportable members
@export var speed: float = 300.0
#endregion

##region Components
#@export var health_component: HealthComponent
#@export var hurt_box: HurtBoxComponent
##endregion

##region Onready vars
@onready var gun: Gun = $Gun
@onready var screen_size: Vector2 = get_viewport_rect().size
##endregion

func _process(_delta):
	var shooting := Input.is_action_pressed("shoot")
	if shooting and gun.timer.is_stopped():
		gun.shoot()

func _physics_process(delta):
	self.velocity = Input.get_vector("left", "right", "up", "down") * speed
	self.position += self.velocity * delta
	self.position = self.position.clamp(Vector2.ZERO, screen_size)
	

