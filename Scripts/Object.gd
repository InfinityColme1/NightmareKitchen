class_name Gadget

extends RigidBody2D

#States if the gadget is in range to use
var _selected = false

func selected():
	_changeColor(Color.RED)
	_selected = true
	#print(self.name + " is selected")

func reset():
	_changeColor(Color.WHITE)
	_selected = false

func use():
	if _selected:
		print(self.name +" is being used")

func isSelected():
	return _selected

#ABSTRACT METHOD this will be implemented in child classes
func _changeColor(color: Color):
	pass
