extends "res://PlayerBase.gd"

func _init():
	self.ui_right = 'p3_right'
	self.ui_left = 'p3_left'
	self.ui_select = 'p3_jump'
	
	self.lucky = true


func _on_Bucket_body_entered(body):
	if body.name == self.name:
		self.position.x = 58
		self.position.y = 515
		self.vel = Vector2(0,0)
