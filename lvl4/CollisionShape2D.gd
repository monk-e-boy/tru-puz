extends CollisionShape2D


var prev_angle = self.rotation


func _process(delta):
	if int(self.rotation_degrees) != self.prev_angle:
		self.prev_angle = int(self.rotation_degrees)
		
		print(self.rotation_degrees)
		
		if self.rotation_degrees > 55 and self.rotation_degrees < 65:
			print("YES ANGLE")
