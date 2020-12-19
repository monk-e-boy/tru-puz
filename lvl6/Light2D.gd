extends Light2D


var d = true
var energy_min = 0.3
var energy_max = 1.0
var speed = 0.07

func _process(delta):

	if d:
		self.energy = lerp(self.energy, energy_min, speed)
		if self.energy < energy_min*1.01:
			d = ! d
			speed = rand_range(0.09, 0.03)
	else:
		self.energy = lerp(self.energy, energy_max, speed)
		if self.energy > energy_max * 0.95:
			d = ! d
