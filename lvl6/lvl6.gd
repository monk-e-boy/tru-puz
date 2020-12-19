extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$CanvasModulate.visible = true
	$Bubbles.playing = true
	$Bubbles2.playing = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


#Input handler, listen for ESC to exit app
func _input(event):
	if(event.is_pressed()):
		if(event.scancode == KEY_ESCAPE):
			get_tree().quit() 

var lights = []

func _light_switched_on(num):
	if not (num in self.lights):
		self.lights.append(num)
		
		#$LightCount.text = str(lights) + "/19"
		if len(lights) == 20:
			$LightCount.set_text(str(len(lights)) + "/20\nYou may\n             now exit")
		else:
			$LightCount.set_text(str(len(lights)) + "/20")

func _on_TripLight14_switched_on():
	self._light_switched_on(14)


func _on_TripLight15_switched_on():
	self._light_switched_on(15)


func _on_TripLight_switched_on():
	self._light_switched_on(1)


func _on_TripLight2_switched_on():
	self._light_switched_on(2)


func _on_TripLight5_switched_on():
	self._light_switched_on(5)


func _on_TripLight6_switched_on():
	self._light_switched_on(6)


func _on_TripLight7_switched_on():
	self._light_switched_on(7)


func _on_TripLight8_switched_on():
	self._light_switched_on(8)


func _on_TripLight9_switched_on():
	self._light_switched_on(9)


func _on_TripLight10_switched_on():
	self._light_switched_on(10)


func _on_TripLight11_switched_on():
	self._light_switched_on(11)


func _on_TripLight12_switched_on():
	self._light_switched_on(12)


func _on_TripLight13_switched_on():
	self._light_switched_on(13)


func _on_TripLight16_switched_on():
	self._light_switched_on(16)


func _on_TripLight17_switched_on():
	self._light_switched_on(17)


func _on_TripLight18_switched_on():
	self._light_switched_on(18)


func _on_TripLight19_switched_on():
	self._light_switched_on(19)


func _on_TripLight20_switched_on():
	self._light_switched_on(20)


func _on_TripLight21_switched_on():
	self._light_switched_on(21)


func _on_TripLight22_switched_on():
	self._light_switched_on(22)
