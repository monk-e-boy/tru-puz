extends Node2D




var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Spring_bounce():
	#$PlayerBlue.vel.y = -1200
	#$PlayerBlue.vel.x = 800
	#$PlayerBlue.wind = 800
	
	#$PlayerBlue.bounce(400, -1200)
	var speed = -1100
	$PlayerBlue.bounce(400 + rng.randf_range(-80, 80), speed, 30)
	$PlayerGreen.bounce(400 + rng.randf_range(-80, 80), speed, 30)
	$PlayerYellow.bounce(400 + rng.randf_range(-80, 80), speed, 30)


# Wonderful weather we're having. Just a shame
# your drowning and probably won't appreciate it

#Input handler, listen for ESC to exit app
func _input(event):
	if event is InputEventKey:
		if event.is_pressed():
			if event.scancode == KEY_ESCAPE:
				get_tree().quit() 


func _on_Spring2_bounce():
	var speed = -1200
	$PlayerBlue.bounce(300 + rng.randf_range(-80, 80), speed, 30)
	$PlayerGreen.bounce(300 + rng.randf_range(-80, 80), speed, 30)
	$PlayerYellow.bounce(300 + rng.randf_range(-80, 80), speed, 30)


func _on_Spring3_bounce():
	var speed = -1500
	$PlayerBlue.bounce(rng.randf_range(-80, 80), speed, 30)
	$PlayerGreen.bounce(rng.randf_range(-80, 80), speed, 30)
	$PlayerYellow.bounce(rng.randf_range(-80, 80), speed, 30)
