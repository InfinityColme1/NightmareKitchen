class_name Pantry
extends "res://Scripts/Object.gd"


@onready var sprite: Sprite2D = $Sprite2D

#Name of the level that will load
const DIRECTION = "Storage"

#Signal to open pantry
signal onPantryOpened

#Changes the color of the sprite when selected
func _changeColor(color: Color):
	sprite.set_modulate(color)

#Emits a signal to load pantry
func use():
	emit_signal("onPantryOpened", DIRECTION)
