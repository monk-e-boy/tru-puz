extends KinematicBody2D

#
# MOVEMENT
#
var vel = Vector2(0,0)
var jumping = false
var jumping_double = false
var moving = 0
const LEFT = 1
const RIGHT = 2

#
# STRENGTH
#
export (int) var jump_speed = -400
export (int) var gravity = 1200
const SPEED = 180
const GRAVITY = 1200
var lucky = (randi() % 20) > 4

#
# GUI
#
var ui_right = ''
var ui_left = ''
var ui_select = ''

#
# SIGNALS
#
signal jump
signal double_jump


func process_input():
	var right = Input.is_action_pressed(ui_right)
	var left = Input.is_action_pressed(ui_left)
	var jump = Input.is_action_just_pressed(ui_select)
	
	if right:
		self.vel.x = SPEED
		self.moving = RIGHT
	
	if left:
		self.vel.x = -SPEED
		self.moving = LEFT
	
	if jump and is_on_floor():
		self.jumping = true
		self.jumping_double = false
		self.vel.y = jump_speed
		emit_signal("jump")

	if jump and not is_on_floor() and not self.jumping_double:
		self.jumping = true
		self.jumping_double = true
		self.vel.y = jump_speed
		emit_signal("double_jump")


func _physics_process(delta):
	self.process_input()
	
	self.vel.y += GRAVITY * delta
	if self.jumping and is_on_floor():
		self.jumping = false
		self.jumping_double = false
	
	var v = move_and_slide(self.vel, Vector2(0, -1), false, 4, 0.785398, false)
	
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		if not ("Floor" in collision.collider.name):
			# print("Collided with: ", collision.collider.name)
			if collision.collider.has_method("pushed"):
				# we are attempting to push the other player
				# to stop:
				#  - jitter
				#  - us moving, the other player moving into us
				# we'll do some checks here
				if self.is_moving() and not collision.collider.is_moving():
					# push them in the direction we are attempting to move:
					collision.collider.pushed(self.moving)
	
	self.vel = v
	self.vel.x = lerp(self.vel.x, 0, 0.3)
	self.moving = 0


func is_moving():
	return not self.moving == 0
	
func pushed(direction):
	# lucky players are stronger than unlucky players
	#var amt = 0.1 if self.lucky else 0.5
	var amt = 0.5
		
	if direction == RIGHT:
		self.vel.x = SPEED * amt
	
	if direction == LEFT:
		self.vel.x = -SPEED * amt
