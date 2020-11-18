extends RigidBody2D

var second = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_StartBoxDrop_body_entered(body):
	# the second time a player enters the area, this box will drop
	if second:
		self.sleeping = false
	second = true
