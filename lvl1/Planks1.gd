extends RigidBody2D



func _on_Planks1_body_entered(body):
	print("!!!!")
	if "Player" in body.name:
		print("Apply force")
		self.apply_impulse(Vector2(), Vector2(0, 200))
