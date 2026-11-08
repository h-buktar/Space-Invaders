extends CharacterBody2D

signal laser_shot(laser_scene, location)

@export var speed = 300
@onready var muzzle = $Muzzle

var laser_scene = preload("res://scenes/laser.tscn")

func _process(delta):
	if Input.is_action_just_pressed("shoot"):
		shoot()

func _physics_process(delta):
	var direction = Input.get_axis("Left", "Right")
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.y = -speed

	move_and_slide()
	
	
func shoot():
	laser_shot.emit(laser_scene, muzzle.global_position)
	
