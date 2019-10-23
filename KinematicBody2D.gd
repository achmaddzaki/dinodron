extends KinematicBody2D

const gravity = 30
const jump_high = 700
var currentposition = Vector2()

func _physics_process(delta):
	currentposition.y += gravity
	if(is_on_floor()):
		$AnimatedSprite.play("Run")
		if(Input.is_action_pressed("ui_up")):
			currentposition.y -= jump_high
	else:
		if(currentposition.y - get_position().y < 0):
			$AnimatedSprite.play("JumpUp")
		else:
			$AnimatedSprite.play("JumpDown")
	
	currentposition = move_and_slide(currentposition, Vector2.UP)
	pass