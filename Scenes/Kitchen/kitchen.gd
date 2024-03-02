class_name Kitchen
extends Node2D

#Camera that the game is currently using
var currentCamera: Cameras

#Boolean state that indicates if the day is over
var dayOver: bool = false

#Signal to change level
signal changeLevel

# Called when the node enters the scene tree for the first time.
func _ready():
	#Set kitchenCamera as default camera
	currentCamera = $Cameras/KitchenCamera
	currentCamera.make_current()


#Changes current camera of the game
func _changeCamera():
	currentCamera.set_enabled(false)
	currentCamera = currentCamera.nextCamera
	currentCamera.set_enabled(true)
	currentCamera.make_current()


#Sends signal to SceneSwitcher to change level
func _changeLevel(direction: String):
	emit_signal("changeLevel", direction, dayOver)

#When player not visible, calls changeCamera()
func _on_player_change_camera():
	_changeCamera()

#When pantry opened requests a level change
func _on_pantry_opened(direction: String):
	_changeLevel(direction)
