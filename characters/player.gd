extends CharacterBody2D

@export var speed = 100
@export var acceleration = 5
@export var friction = 2.5
@export var gravity = 9.8
@export var jump = 250

@onready var bulletpath = preload("res://fx/bullet.tscn")

func applyGravity():
	if !is_on_floor():
		velocity.y +=gravity
	
func _physics_process(delta):
	
	var input = Input.get_action_strength("right") - Input.get_action_strength("left")
	
	if input != 0:
		if velocity.x < speed and velocity.x > -speed: 
			velocity.x += input*acceleration
	else:
		if velocity.x > 0:
			velocity.x -= friction
		if velocity.x < 0:
			velocity.x += friction
	
	if Input.is_action_pressed("jump"):
		if is_on_floor():
			velocity.y = 0
			velocity.y = -jump
	
	if Input.is_action_just_pressed("shoot"):
		var bullet = bulletpath.instantiate()
		get_parent().add_child(bullet)
		bullet.position = $Node2d/Marker2d.global_position
		bullet.velocity = get_global_mouse_position() - bullet.position
		
	applyGravity()
	move_and_slide()
