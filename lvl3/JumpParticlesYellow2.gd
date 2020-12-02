extends Particles2D

func _on_PlayerYellow_double_jump():
	self.one_shot = true
	self.restart()
	print("Emmit")
