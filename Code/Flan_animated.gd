extends AnimatedSprite2D
func characteranim():
	if Input.is_action_pressed("move_right"):
		$Flan/AnimatedSprite2D.play = "Walk_right"
	if Input.is_action_pressed("move_left"):
		$Flan/AnimatedSprite2D.play = "Walk_left"
	if Input.is_action_pressed("move_down"):
		$Flan/AnimatedSprite2D.play = "Walk_down"
	if Input.is_action_pressed("move_up"):
		$Flan/AnimatedSprite2D.play = "Walk_up"
