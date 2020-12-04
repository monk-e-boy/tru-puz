extends Node2D

var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()

func _on_Bucket_body_entered(body):
	if "Player" in body.name:
		body.position.y = 0
		var new_x = body.position.x + rng.randf_range(-300, 300)
		body.position.x = clamp(new_x, 10, 1024-10)
		body.vel = Vector2(0,0)
