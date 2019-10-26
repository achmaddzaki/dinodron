extends KinematicBody2D

const gravity = 30
const jump_high = 700
var currentposition = Vector2()

var needscaled = true

func _physics_process(delta):
	currentposition.y += gravity
	currentposition.x = 0
	if(needscaled):
		if(get_node("..").speed > 800):
			$AnimatedSprite.set_speed_scale(2)
			needscaled = false
		elif(get_node("..").speed > 600):
			$AnimatedSprite.set_speed_scale(1.5)
		
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

#Game Over
func _on_Area2D_body_entered(body):
	if(body.name == "KinematicBody2D"):
		get_node("../LabelContainer").visible = true
		get_node("..").gameover = true
		get_node("../RichTextLabel").set_process(false)
		$AnimatedSprite.stop()
		set_physics_process(false)
	pass # Replace with function body.
