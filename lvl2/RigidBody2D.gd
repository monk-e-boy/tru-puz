extends RigidBody2D

var p = Vector2(0,0)

func _init():
	self.p = self.position


func _on_Area2D_body_entered(body):
	self.position = self.p
