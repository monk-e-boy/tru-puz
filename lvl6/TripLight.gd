extends Node2D

signal switched_on

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Light2D_switched_on():
	emit_signal("switched_on")
