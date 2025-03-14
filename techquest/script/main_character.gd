extends CharacterBody2D
	
@export var movement_speed = 100
@export var sprint_speed = 200
func _physics_process(_delta):
	var  input_direction = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	)
	if  Input.is_action_pressed("sprint"):
		velocity = input_direction * sprint_speed
	else :
		velocity = input_direction * movement_speed
	
	move_and_slide()

 
