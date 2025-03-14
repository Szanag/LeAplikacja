extends CharacterBody2D
	
@export var movement_speed = 100

func _physics_process(_delta):
	var  input_direction = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	)
	while  Input.get_action_strength("sprint") == 1:
		movement_speed = 200
	velocity = input_direction * movement_speed
	move_and_slide()

 
