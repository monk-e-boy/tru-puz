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
		$Fin.frame = 2
		var n = get_node("../YouWin")
		n.show()
	else:
		$Fin.frame = 1
