extends CharacterBody2D


const SPEED = 300.0



func _physics_process(delta: float) -> void:
	var direction := Input.get_axis("Left", "Right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = -SPEED

	move_and_slide()
