extends RigidBody2D
signal outOfBoundsLeft
signal outOfBoundsRight
signal gameover


export (Vector2) var initialVector = Vector2(250,-250)
var initialPosition = Vector2()

var applyInitial = false
var resetTransform = false

func _ready():
	initialPosition = get_global_transform().origin

func start():
	applyInitial = true

# You need to do any physics messing within this method against 
# physics state - they won't work anywhere else. Hence just setting booleans in places.
func _integrate_forces(state):
	if resetTransform:
		state.linear_velocity = Vector2()
		state.transform = Transform2D(0.0, initialPosition)
		resetTransform = false
		
	if applyInitial:
		applyInitial = false
		state.linear_velocity = initialVector
	
func _on_blockRigidBody2D_body_entered(body):
	if body.get_name() == "left" ||  body.get_name() == "right":
		if body.get_name() == "left":
			emit_signal('outOfBoundsLeft')
		elif body.get_name() == "right":
			emit_signal('outOfBoundsRight')
		
		# Pause the block moving
		resetTransform = true
		
		# notify other objects that it's game over!
		emit_signal('gameover')