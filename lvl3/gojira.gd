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
		self.heart_baet = 10 + rng.randf_range(0, 60)


	if self.on:
		self.frame = 1
	else:
		self.frame = 0
		
