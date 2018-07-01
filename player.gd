extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

export  (int) var speed = 500

export (String) var UP_INPUT_ACTION = "player1-up"	 
export (String) var DOWN_INPUT_ACTION = "player1-down"


var playerCanMove = false
var initialPosition = Vector2();
func _ready():
	initialPosition = position	

func start():
	reset()
	playerCanMove = true 
	
func reset():
	playerCanMove = false
	position = initialPosition

func _process(delta):
	if playerCanMove:
		var velocity = Vector2() # the player's movement vector
		if Input.is_action_pressed(DOWN_INPUT_ACTION):
			velocity.y += 1
		if Input.is_action_pressed(UP_INPUT_ACTION):
			velocity.y -= 1
		
		position += velocity*delta*speed