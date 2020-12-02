extends Particles2D

func _on_PlayerGreen_jump():
	self.emitting = true
	self.one_shot = true
	self.restart()
