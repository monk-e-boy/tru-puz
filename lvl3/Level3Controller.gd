extends Node2D

#
# PLAYER HAS FALLEN OFF THE WORLD
#
func _on_Bucket_body_entered(body):
	if "Player" in body.name:
		body.position.x = 58
		body.position.y = 515
		body.vel = Vector2(0,0)
		body.emit_signal("jump")
