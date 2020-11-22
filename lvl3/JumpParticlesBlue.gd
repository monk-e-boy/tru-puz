extends Particles2D




func _on_PlayerBlue_jump():
#	self.emitting = true
	self.one_shot = true
	self.restart()
	print("Emmit")
