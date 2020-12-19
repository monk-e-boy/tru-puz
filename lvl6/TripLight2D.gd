extends Light2D

signal switched_on

func _ready():
	# set this here so when we are editing the
	# level it is on
	self.visible = false

func _process(delta):
	if self.visible and self.energy<1.0:
		self.energy = lerp(self.energy, 0, 0.03)
		
func _on_Area2D_body_entered(body):
	if "Player" in body.name:
		self.visible = true
		emit_signal("switched_on")
