extends Node2D

var bgs = Array()
var obstacles = Array()
var moving_obstacles = Array()
const bg_width = 800
const speed = 400
var gameover = false

func setgameover():
	gameover = true
	pass

func _ready():
	bgs = $background.get_children()
	obstacles = $obstacles.get_children()
	pass
	
func _process(delta):
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
			if(rnd < 10):
				obstacle = obstacles[0]
			elif(rnd < 20):
				obstacle = obstacles[1]
			else:
				obstacle = obstacles[2]
			
			var vctr = obstacle.get_position()
			vctr.x += bg_width + 200
			obstacle.set_position(vctr)
			moving_obstacles.push_back(obstacle)
	pass

