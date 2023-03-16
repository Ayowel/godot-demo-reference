extends CharacterBody2D

@export var speed = 400

@onready var animation: AnimatedSprite2D = get_node("Animation")

func get_input():
	var input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = input_direction * speed

func _physics_process(_delta):
	get_input()
	move_and_slide()

func _process(_d):
	if (velocity.x < 0):
		animation.play("walk_left")
	elif(velocity.x > 0):
		animation.play("walk_right")
	elif(velocity.y < 0):
		animation.play("walk_up")
	elif(velocity.y > 0):
		animation.play("walk_down")
	else:
		animation.pause()
