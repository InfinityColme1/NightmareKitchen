class_name SceneSwitcher
extends Node

@onready var currentLevel = $Kitchen

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
#	currentLevel.connect("changeLevel",handleLevelChange)


func handleLevelChange(direction: String, dayOver: bool):
	var nextLevel 
	
	if !dayOver:
		nextLevel = load("res://Scenes/Interiors/" + direction + ".tscn").instantiate()
	
	add_child(nextLevel)
	nextLevel.connect("changeLevel", handleLevelChange)
	currentLevel.queue_free()
	currentLevel = nextLevel
	
