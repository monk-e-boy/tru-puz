extends AnimatedSprite

var change = false
var count = 0
var heart_baet = 10
var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()
	

func _process(delta):

	self.count += 1
	if self.count > self.heart_baet:
		self.change = true
		self.count = 0
		self.heart_baet = 2 + rng.randf_range(0, 4)


	if self.change:
		var tmp = rng.randf_range(0, 100)
		if tmp > 90:
			self.frame = 1
		elif tmp > 80:
			self.frame = 2
		elif tmp > 70:
			self.frame = 3
		elif tmp > 60:
			self.frame = 4
		else:
			# spend a bit more time OFF
			self.frame = 0
			self.heart_baet += 5
		self.change = false
		
