extends Sprite

const FOLLOW_SPEED = 2.0
var start_moving = false

func _physics_process(delta):
	var follow_pos = get_node("../PlayerYellow").position
	
	if follow_pos.distance_to(position) > 30:
		start_moving = true
	
	if follow_pos.distance_to(position) < 8:
		start_moving = false
	
	if start_moving:
		position = position.linear_interpolate(follow_pos, delta * FOLLOW_SPEED)
