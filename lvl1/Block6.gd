extends RigidBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_StartBoxDrop_body_entered(body):
	self.sleeping = false
