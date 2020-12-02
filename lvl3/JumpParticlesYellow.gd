extends Particles2D

func _on_PlayerYellow_jump():
	self.one_shot = true
	self.restart()
	# print("Emmit")
