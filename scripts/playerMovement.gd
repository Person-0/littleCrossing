extends CharacterBody2D

@onready var sprite = $AnimatedSprite2D

const SPEED = 250.0
var isAnim = false

func _physics_process(delta: float) -> void:
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		if not isAnim:
			isAnim = true
			sprite.play("walk")
		if direction < 0:
			sprite.flip_h = true
		else:
			sprite.flip_h = false
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if isAnim:
			isAnim = false
			sprite.play("idle")
			
	move_and_slide()
