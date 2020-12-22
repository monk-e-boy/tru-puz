extends StaticBody2D

signal bounce

var players = []
var reset_timer = 0

func _ready():
	pass # Replace with function body.


func _process(delta):
	if reset_timer > 0:
		reset_timer -= 1

func process_spring():
	$SpringPlatform.position.y = len(self.players) * 4
	$CollisionShape2D.position.y = len(self.players) * 4
	$SpringPlatform.frame = len(self.players)

	
func _on_Area2D_body_entered(body):
	if not ("Player" in body.name):
		return
	
	if not (body.name in self.players):
		self.players.append(body.name)
	
	reset_timer = 10
	self.process_spring()
	print(self.players)
	
	if len(self.players) > 2:
		emit_signal("bounce")
		reset_timer = 0


func _on_Area2D_body_exited(body):
	if not ("Player" in body.name):
		return
	
	if body.name in self.players:
		self.players.remove(self.players.find_last(body.name))
	
	if reset_timer < 1:
		self.process_spring()
	print("Exited:", self.players)
