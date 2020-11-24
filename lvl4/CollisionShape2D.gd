extends CollisionShape2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var color = Color.white
	var ext:Vector2 = shape.extents
	var rect:Rect2 = Rect2(Vector2(-ext.x, -ext.y), ext*2)
	draw_rect(rect, color, true)
