extends Node2D

var rng = RandomNumberGenerator.new()


func _ready():
	rng.randomize()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2DReset_body_entered(body):
	if "Player" in body.name:
		get_tree().reload_current_scene()


func _on_MetallicaDetect_body_entered(body):
	pass # Replace with function body.


func _on_MetallicaDetect_body_exited(body):
	pass # Replace with function body.


func _on_Bucket_body_entered(body):
	if "Player" in body.name:
		body.position.y = 0
		var new_x = body.position.x + rng.randf_range(-100, 20)
		body.position.x = clamp(new_x, 10, 1024-10)
		body.vel = Vector2(0,0)
