extends KinematicBody2D

#
# MOVEMENT
#
var vel = Vector2(0,0)
var jumping = false
var jumping_double = false
var moving = 0
# bounce pads set this:
var bounce_vel_x = 0
var bounce_timer = 0
var bounce_timer_max = 0
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


func bounce(vel_x, vel_y, bounce_timer_max):
	self.jump_action()
	self.bounce_vel_x = vel_x
	# this is set in jump_action - overwrite it here
	self.vel.y = vel_y
	# depends on how high they bounce
	self.bounce_timer_max = bounce_timer_max
	self.bounce_timer = 0


func jump_action():
	self.jumping = true
	self.jumping_double = false
	self.vel.y = jump_speed
	emit_signal("jump")

func process_input():
	var right = Input.is_action_pressed(ui_right)
	var left = Input.is_action_pressed(ui_left)
	var jump = Input.is_action_just_pressed(ui_select)
	
	if right:
		self.vel.x = SPEED
		self.moving = RIGHT
		self.bounce_vel_x = 0
		
	
	if left:
		self.vel.x = -SPEED
		self.moving = LEFT
		self.bounce_vel_x = 0
	
	if jump and is_on_floor():
		jump_action()

	if jump and not is_on_floor() and not self.jumping_double:
		self.jumping = true
		self.jumping_double = true
		self.vel.y = jump_speed
		emit_signal("double_jump")


func _physics_process(delta):
	
	if not self.bounce_timer < self.bounce_timer_max:
		# ignore user input if bouncing off pad
		self.process_input()
	
	self.vel.x += self.wind * delta
	self.vel.y += GRAVITY * delta
	
	var v = move_and_slide(self.vel, Vector2(0, -1), false, 4, 0.785398, false)
	
	if self.bounce_timer < self.bounce_timer_max:
		self.bounce_timer += 1
	
	if self.jumping and is_on_floor():
		self.jumping = false
		self.jumping_double = false
		# reset the bounce pad velocity:
		self.bounce_vel_x = 0
		print("reset BOUNCE")
	
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
	if self.bounce_vel_x > 0:
		# bouncepad:
		self.vel.x = self.bounce_vel_x
	else:
		# user is pressing left or right:
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

var wind = 0
func set_wind(val):
	self.wind = val
	
