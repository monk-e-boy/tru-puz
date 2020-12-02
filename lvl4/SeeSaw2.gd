extends Node2D

signal is_eleven(how_close)

var prev_angle = 0

func _process(delta):
	var t = $Tilt
	
	if int(t.rotation_degrees) != self.prev_angle:
		self.prev_angle = int(t.rotation_degrees)
		
		print(t.rotation_degrees)
		
		if self.prev_angle > -120-5 and self.prev_angle < -120+5:
			print("YES ANGLE")
			# BULB is 0, 1, 2, 3
			emit_signal("is_eleven", 3)
		elif self.prev_angle > -120-15 and self.prev_angle < -120+15:
			emit_signal("is_eleven", 2)
		elif self.prev_angle > -120-25 and self.prev_angle < -120+25:
			emit_signal("is_eleven", 1)
		else:
			emit_signal("is_eleven", 0)


func _on_PlayerYellow_jump():
	var player_node = get_node("/root/Node2D/PlayerYellow/")
	self._jump(player_node)

func _on_PlayerBlue_jump():
	var player_node = get_node("/root/Node2D/PlayerBlue/")
	self._jump(player_node)

func _on_PlayerGreen_jump():
	var player_node = get_node("/root/Node2D/PlayerGreen/")
	self._jump(player_node)

func _jump(player_node):
	
	for i in player_node.get_slide_count():
		var collision = player_node.get_slide_collision(i)
		if collision.collider.get_parent().name == self.name:
			$Tilt._player_jump(player_node)






