extends AnimatedSprite

var on = false
var count = 0
var heart_baet = 10
var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()
	

func _process(delta):

	self.count += 1
	if self.count > self.heart_baet:
		self.on = not self.on
		self.count = 0
		self.heart_baet = 20 + rng.randf_range(0, 60)

		if self.on:
			self.frame = rng.randf_range(1, 4)
		else:
			self.frame = 0
