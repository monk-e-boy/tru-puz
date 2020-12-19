extends Label

# Select your particle-node in the scene-tree and (in the inspector) add a
# material (CanvasItem > Material > New CanvasItemMaterial) and set 
# "Light mode" to "Unshaded"


func set_text(s):
	self.rect_scale = Vector2(5,5)
	$Tween.interpolate_property(
		self,
		"rect_scale",
		Vector2(5,5),
		Vector2(3,3),
		0.4,
		Tween.TRANS_LINEAR,
		Tween.EASE_IN_OUT
	)
	
#	var r = self.get_rect()
#	$Tween.interpolate_property(
#		self,
#		"rect_position",
#		self.rect_position(),
#		self.rect_position()-self.rect_size()*1.5,
#		0.7,
#		Tween.TRANS_LINEAR,
#		Tween.EASE_IN_OUT
#	)
	$Tween.start()
	
	self.text = s
