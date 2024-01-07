extends CharacterBody2D

@export var speed: float = 300.0
#@export var bullet: Bullet = null
const bulletScene = preload("res://scenes/Bullet/Bullet.tscn")

@onready var Gun := $LeftGun.get_node("Gun")
@onready var Gun2 := $RightGun.get_node("Gun")
@onready var timer := $Timer

func _process(delta):
	var shooting := Input.is_action_pressed("shoot")
	if shooting and timer.is_stopped():
		shoot()
		timer.start()

func _physics_process(delta):
	self.velocity = Input.get_vector("left", "right", "up", "down") * speed

	move_and_slide()
	
func shoot():
	var bullet = bulletScene.instantiate()
	get_parent().add_child(bullet)
	bullet.position = self.Gun.global_position
	
	var bullet2 = bulletScene.instantiate()
	get_parent().add_child(bullet2)
	bullet2.position = self.Gun2.global_position
