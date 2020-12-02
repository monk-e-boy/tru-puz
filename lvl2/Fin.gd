extends ColorRect

var players = []


func add_player(body):
	if "Player" in body.name:
		if not (body.name in self.players):
			self.players.append(body.name)
		print(self.players)
		
	if len(self.players) == 3:
		self.visible = true


func remove_player(body):
	if "Player" in body.name:
		if body.name in self.players:
			self.players.remove(self.players.find_last(body.name))
		print(self.players)

	self.visible = false


func _on_MetallicaDetect_body_entered(body):
	self.add_player(body)

func _on_MetallicaDetect_body_exited(body):
	self.remove_player(body)

func _on_SlipknotDetect_body_entered(body):
	self.add_player(body)

func _on_SlipknotDetect_body_exited(body):
	self.remove_player(body)

func _on_SOADDetect_body_entered(body):
	self.add_player(body)

func _on_SOADDetect_body_exited(body):
	self.remove_player(body)
