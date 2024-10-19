extends CharacterBody2D

@onready var anim = get_node("Flan/AnimatedSprite2D")
func _physics_process(delta):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * 600
	
	if(Input.is_anything_pressed()==true and direction == "move_right"):
		anim.play("Walk_Right")
	if(Input.is_anything_pressed()==true and direction == "move_left"):
		anim.play("Walk_Left")
	if(Input.is_anything_pressed()==true and direction == "move_up"):
		anim.play("Walk_Up")
	if(Input.is_anything_pressed()==true and direction == "move_down"):
		anim.play("Walk_Down")
	if(Input.is_anything_pressed()==false and direction == "move_right"):
		anim.play("Idle_Right")
	if(Input.is_anything_pressed()==false and direction == "move_left"):
		anim.play("Idle_Left")
	if(Input.is_anything_pressed()==false and direction == "move_up"):
		anim.play("Idle_Up")
	if(Input.is_anything_pressed()==false and direction == "move_down"):
		anim.play("Idle_Down")	
		
	move_and_slide()
	


