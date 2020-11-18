extends Node2D


var player_count = 0

func _on_POPP2Detector_body_entered(body):
	if "Player" in body.name:
		self.player_count += 1
		level_complete()

func _on_POPP2Detector_body_exited(body):
	if "Player" in body.name:
		self.player_count -= 1

func _on_POPODetector_body_entered(body):
	if "Player" in body.name:
		self.player_count += 1
		level_complete()

func _on_POPODetector_body_exited(body):
	if "Player" in body.name:
		self.player_count -= 1

func _on_POPDetector_body_entered(body):
	if "Player" in body.name:
		self.player_count += 1
		level_complete()

func _on_POPDetector_body_exited(body):
	if "Player" in body.name:
		self.player_count -= 1

func level_complete():
	#print(self.player_count)
	if self.player_count == 3:
		print("LEVEL COMPLETE")
		get_tree().change_scene("res://Level2.tscn")