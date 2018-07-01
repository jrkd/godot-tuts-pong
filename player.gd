extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

export  (int) var speed = 100

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	
	var velocity = Vector2() # the player's movement vector
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	
	position += velocity*delta*speed