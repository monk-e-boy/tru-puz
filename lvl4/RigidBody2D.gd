extends RigidBody2D

class_name PinkSeeSaw

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func _on_PlayerGreen_jump():
	var player_node = get_node("/root/Node2D/PlayerGreen/")
	self._player_jump(player_node)


func _on_PlayerBlue_jump():
	var player_node = get_node("/root/Node2D/PlayerBlue/")
	self._player_jump(player_node)

func _on_PlayerYellow_jump():
	var player_node = get_node("/root/Node2D/PlayerYellow/")
	self._player_jump(player_node)

func _player_jump(tmp):
	# this does NOT give us the players:
	# self.get_colliding_bodies()
	
	for i in tmp.get_slide_count():
		var collision = tmp.get_slide_collision(i)
		print("Collided with: ", collision.collider.name)
		if collision.collider.name == self.name:
			print("pos", collision.position)
			print("pos 2", collision.collider.position)
			var diff = collision.position - collision.collider.position
			var direction = -1 if diff.x > 0 else 1
			var dist_to_center = collision.position.distance_to(collision.collider.position)
			print("Dist:", dist_to_center, "  direction:", direction)
			
			self.apply_impulse(
				Vector2(dist_to_center * direction, 0),
				Vector2(0, -245)
			)
		
#	for item in items:
#		print(item.name)
	#self.apply_impulse(Vector2(30,0), Vector2(0,-245))






