extends AnimatedSprite


func _on_MetallicaDetect_body_entered(body):
	if "Player" in body.name:
		self.frame = 1


func _on_MetallicaDetect_body_exited(body):
	self.frame = 0
