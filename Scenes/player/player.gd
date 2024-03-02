extends CharacterBody2D

#Walking speed and running speed of the player
@export var wSpeed: float = 250.0
@export var rSpeed: float  = 350.0
@export var stamina: float = 100.0

#Increse to stop player from gliding
const FRICTION = 30

#Stamina decresing rate
const FATIGUE = 20


#Current speed and stamin of the player
var currentSpeed
var currentStamina

#Area in which the player can interact
var actionArea

#Gadget that is currently up to use
var gadget: Gadget
var newGadget: Gadget

#Signal to change camera
signal changeCamera

func _ready():
	
	#Reference to the action area
	actionArea = $ActionArea
	
	#Set current speed to walking
	currentSpeed = wSpeed
	
	#Set current stamina to max
	currentStamina = stamina


func _physics_process(delta):
	
	if Input.is_action_just_pressed("Interact"):
		if gadget:
			gadget.use()
	
	# Handles running input
	if Input.is_action_pressed("Run") and velocity.x != 0 and currentStamina > 0:
		print("Running")
		currentSpeed = rSpeed
		currentStamina -= FATIGUE * delta
	else:
		print("Walking")
		currentSpeed = wSpeed
		if currentStamina < stamina:
			currentStamina += FATIGUE * delta

	# Get the input direction and handle the movement/deceleration.
	var direction = Input.get_axis("Left", "Right")
	if direction:
		velocity.x = direction * currentSpeed
		actionArea.set_scale(Vector2(direction, 1))
	else:
		velocity.x = move_toward(velocity.x, 0, FRICTION)
		
	move_and_slide()

#When an object enters in action area now it will be up to use
func _on_action_area_body_entered(body):
	if body is Gadget:
		newGadget = body
		if gadget:
			gadget.reset()
		gadget = newGadget
		gadget.selected()

#When an object exits action area it wont be usable
func _on_action_area_body_exited(body):
	if body is Gadget:
		if body == gadget:
			gadget.reset()
	


func _on_visible_on_screen_notifier_2d_screen_exited():
	emit_signal("changeCamera")
