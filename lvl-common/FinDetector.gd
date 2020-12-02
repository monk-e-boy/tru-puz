extends Node2D

signal have_all_players

func _on_CollisionShape2D_have_players(count):
	if count == 0:
		$Fin.frame = 0
	elif count == 3:
		$Fin.frame = 2
		emit_signal("have_all_players")
		#var n = get_node("../YouWin")
		#n.show()
	else:
		$Fin.frame = 1
