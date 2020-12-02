extends Panel


func _on_FinDetector_have_all_players():
	self.visible = true


func _on_Button_pressed():
	get_tree().change_scene("res://lvl4/Level4.tscn")
