extends KinematicBody2D

const gravity = 30
const jump_high = 700
var currentposition = Vector2()

func _physics_process(delta):
	currentposition.y += gravity
	if(is_on_floor()):
		if(Input.is_action_pressed("ui_up")):
			currentposition.y -= jump_high
	
	currentposition = move_and_slide(currentposition, Vector2.UP)
	pass