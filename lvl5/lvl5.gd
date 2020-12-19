extends Node2D


func _ready():
	pass # Replace with function body.


var c = 0
var wind = -30
func _process(delta):
	c += 1
	
	if c > 100:
		self.wind += -5
	$PlayerBlue.set_wind(self.wind)
