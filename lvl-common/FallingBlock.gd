extends RigidBody2D


var start_pos
var start_angle
var reset = false
var set_sleeping = true

func _ready():
	self.start_pos = self.position
	self.start_angle = self.transform.get_rotation()

func _process(delta):
	if self.set_sleeping:
		self.sleeping = true
		self.set_sleeping = false

func _integrate_forces(state):
	if self.reset:
		state.transform = Transform2D(start_angle, start_pos)
		state.linear_velocity = Vector2()
		self.set_sleeping = true
		self.reset = false

func _on_Bucket_body_entered(body):
	self.reset = true
