extends Node2D

var bgs = Array()
var obstacles = Array()
var moving_obstacles = Array()
const bg_width = 800
var speed = 400
var gameover = false

func setgameover():
	gameover = true
	pass

func _ready():
	bgs = $background.get_children()
	obstacles = $obstacles.get_children()
	pass
	
func _process(delta):
	speed += 0.1
	if(!gameover):
	# Backgrounds
		for i in range(bgs.size()):
			var vctr = bgs[i].get_position()
			vctr.x -= delta * speed
			if(vctr.x < -bg_width + (-bg_width * i)):
				vctr.x += bg_width * bgs.size()
			bgs[i].set_position(vctr)
	
	# Obstacles
		var rnd = rand_range(1,100)
		
		if(moving_obstacles.size() > 0):
			for i in range(moving_obstacles.size()):
				var vctr = moving_obstacles[i].get_position()
				if(vctr.x > -100):
					vctr.x -= delta * speed
					moving_obstacles[i].set_position(vctr)
				else:
					moving_obstacles.remove(i)
		else:
			var obstacle
			if(rnd < 20):
				obstacle = obstacles[0]
			elif(rnd < 40):
				obstacle = obstacles[1]
			else:
				obstacle = obstacles[2]
			
			var vctr = obstacle.get_position()
			vctr.x += bg_width + 200
			obstacle.set_position(vctr)
			moving_obstacles.push_back(obstacle)
	else:
		if(Input.is_key_pressed(KEY_SPACE)):
#			Clear Obstacle
			for obstacle in obstacles:
				var vctr = obstacle.get_position()
				vctr.x = -100
				obstacle.set_position(vctr)
			moving_obstacles.clear()
			gameover = false
			var player = get_node("KinematicBody2D")
			player.set_physics_process(true)
			player.needscaled = true
			var playeranimation = get_node("KinematicBody2D/AnimatedSprite")
			playeranimation.rotate(1)
			playeranimation.set_speed_scale(1)
			get_node("LabelContainer").visible = false
			get_node("RichTextLabel").set_process(true)
			get_node("RichTextLabel").score = 0
			speed = 400
	pass

