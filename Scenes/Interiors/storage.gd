extends Node2D

#Boolean state that indicates if the day is over
var dayOver: bool = false

#Signal to change level
signal changeLevel

#Sends signal to SceneSwitcher to change level
func _changeLevel(direction: String):
	emit_signal("changeLevel", direction, dayOver)



func _on_button_button_down():
	_changeLevel("Kitchen")
