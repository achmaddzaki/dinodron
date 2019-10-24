extends RichTextLabel
var score = 0

func _process(delta):
	score += delta
	var str_elapsed = "Score : %d" % [score * 100]
	set_text(str_elapsed)
	pass