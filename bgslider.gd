extends Node2D

var bgs = Array()
const bg_width = 800
const speed = 400

func _ready():
	bgs = $background.get_children();
	pass
	
func _process(delta):
	for i in range(bgs.size()):
		var vctr = bgs[i].get_position()
		vctr.x -= delta * speed
		if(vctr.x < -bg_width + (-bg_width * i)):
			vctr.x += bg_width * bgs.size()
		bgs[i].set_position(vctr)
	pass

