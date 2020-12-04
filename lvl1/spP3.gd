extends AnimatedSprite

func _init():
	self.frame = 0
	
func _on_POPDetector_body_entered(body):
	if "Player" in body.name:
		self.frame = 1


func _on_POPDetector_body_exited(body):
	self.frame = 0
