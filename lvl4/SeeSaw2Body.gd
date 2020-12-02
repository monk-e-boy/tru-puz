extends RigidBody2D

export var player_force = -245
var prev_angle = self.rotation



			

func _player_jump(tmp):
	# this does NOT give us the players:
	# self.get_colliding_bodies()
	
	
	var parent = get_node("..")
	
	for i in tmp.get_slide_count():
		var collision = tmp.get_slide_collision(i)
		#
		# How the F do we find out what instance we have collidededed with?!
		#
		# if collision.collider.name == self.name:
		# if collision.collider_id == self.get_instance_id():
		print("Player pos:", collision.position)
		#print("Pink   pos:", collision.collider.position)
		print("Pink   pos:", parent.position)
		#print("Pink   pos:", parent.getranslation)
		var diff = collision.position - parent.position
		var direction = -1 if diff.x > 0 else 1
		var dist_to_center = collision.position.distance_to(parent.position)
		print("Dist:", dist_to_center, "  direction:", direction)
		self.apply_impulse(
			Vector2(dist_to_center * direction, 0),
			Vector2(0, player_force)
		)


func _player_jump__(tmp):
	for i in tmp.get_slide_count():
		var collision = tmp.get_slide_collision(i)
		print("Collided with: ", collision.collider.name)
		var parent = get_node("..")
		
		# if collision.collider.name == self.name:
		if collision.collider_id == self.get_instance_id():
			print("Player pos:", collision.position)
			#print("Pink   pos:", collision.collider.position)
			print("Pink   pos:", parent.position)
			var diff = collision.position - parent.position
			var direction = -1 if diff.x > 0 else 1
			var dist_to_center = collision.position.distance_to(parent.position)
			print("Dist:", dist_to_center, "  direction:", direction)
			
			return
			
			self.apply_impulse(
				Vector2(dist_to_center * direction, 0),
				Vector2(0, player_force)
			)
