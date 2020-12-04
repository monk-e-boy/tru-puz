extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_FinCollisionShape2D_have_players(count):
	if count == 0:
		$Fin.frame = 0
	elif count == 3:
		
		var bulb_1 = get_node("../Bulb-1")
		var bulb_2 = get_node("../Bulb-2")
		var bulb_3 = get_node("../Bulb-3")
		var bulb_4 = get_node("../Bulb-4")
		
		if bulb_1.frame in [2,3] and bulb_2.frame in [2,3] and bulb_3.frame in [2,3] and bulb_3.frame in [2,3]:
			$Fin.frame = 2
			var n = get_node("../YouWin")
			n.show()
		else:
			$Fin.frame = 4
	else:
		$Fin.frame = 1
