extends RigidBody2D
signal outOfBoundsLeft
signal outOfBoundsRight
signal gameover


export (Vector2) var initialVector = Vector2(250,-250)
var appliedInitial = false
var blockCanMove = false
var initialPosition = Vector2()
func _ready():
	initialPosition = position

func start():
	reset()
	blockCanMove = true 
	
func reset():
	blockCanMove = false
	appliedInitial = false
	position = initialPosition
	set_linear_velocity(Vector2())	

func _integrate_forces(state):
	if appliedInitial == false and blockCanMove:
		appliedInitial = true
		set_linear_velocity(initialVector)

func _on_blockRigidBody2D_body_entered(body):
	if body.get_name() == "left" ||  body.get_name() == "right":
		if body.get_name() == "left":
			emit_signal('outOfBoundsLeft')
		elif body.get_name() == "right":
			emit_signal('outOfBoundsRight')
		
		# Pause the block moving
		reset()
		
		# notify other objects that it's game over!
		emit_signal('gameover')