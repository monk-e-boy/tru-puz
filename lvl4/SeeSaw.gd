extends Node2D


func _on_PlayerYellow_jump():
	var player_node = get_node("/root/Node2D/PlayerYellow/")
	
	for i in player_node.get_slide_count():
		var collision = player_node.get_slide_collision(i)
		if collision.collider.get_parent().name == self.name:
			$Tilt._player_jump(player_node)
