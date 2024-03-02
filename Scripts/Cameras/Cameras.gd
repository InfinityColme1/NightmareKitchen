class_name Cameras
extends Camera2D

#Reference of the camera next to this one
@export var nextCamera: Camera2D

# Called when the node enters the scene tree for the first time.
func _ready():
	#Checks if next camera reference is not null
	assert(nextCamera)

