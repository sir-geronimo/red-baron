extends CharacterBody2D

#region Exportable members
@export var speed: float = 300.0
#endregion

#region Components
@export var health_component: HealthComponent
@export var hurt_box: HurtBoxComponent
#endregion

#region Onready vars
@onready var screen_size: Vector2 = get_viewport_rect().size
@onready var Gun1 := $LeftGun/Gun
@onready var Gun2 := $RightGun/Gun
@onready var timer := $Timer
#endregion

const bulletScene = preload("res://entities/bullet.tscn")

func _process(_delta):
	var shooting := Input.is_action_pressed("shoot")
	if shooting and timer.is_stopped():
		shoot()
		timer.start()

func _physics_process(delta):
	self.velocity = Input.get_vector("left", "right", "up", "down") * speed
	self.position += self.velocity * delta
	self.position = self.position.clamp(Vector2.ZERO, screen_size)
	
func shoot():
	var bullet = bulletScene.instantiate()
	get_tree().root.add_child(bullet)
	bullet.position = self.Gun1.global_position
	
	var bullet2 = bulletScene.instantiate()
	get_parent().add_child(bullet2)
	bullet2.position = self.Gun2.global_position
