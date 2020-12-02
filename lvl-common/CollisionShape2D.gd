extends CollisionShape2D

signal have_players(count)

var players = []

func _on_Area2D_body_entered(body):
	if "Player" in body.name:
		if not (body.name in self.players):
			self.players.append(body.name)
			emit_signal("have_players", len(self.players))
		print(self.players)


func _on_Area2D_body_exited(body):
	if "Player" in body.name:
		if body.name in self.players:
			self.players.remove(self.players.find_last(body.name))
			emit_signal("have_players", len(self.players))
		print(self.players)
