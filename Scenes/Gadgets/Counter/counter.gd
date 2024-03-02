class_name Counter
extends "res://Scripts/Object.gd"

@onready var sprite: Sprite2D = $Sprite2D

#Changes the color of the sprite when selected
func _changeColor(color: Color):
	sprite.set_modulate(color)
