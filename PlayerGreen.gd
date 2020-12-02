extends "res://PlayerBase.gd"

func _init():
	self.ui_right = 'p1_right'
	self.ui_left = 'p1_left'
	self.ui_select = 'p1_jump'
	
	self.lucky = false


#func _on_Area2D_body_entered(body):
#	if body.name == self.name:
#		self.position.y = 0
#		self.vel = Vector2(0,0)


func _on_Bucket_body_entered(body):
	if body.name == self.name:
		self.position.x = 58
		self.position.y = 515
		self.vel = Vector2(0,0)
