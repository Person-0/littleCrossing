extends CharacterBody2D

@onready var sprite = $AnimatedSprite2D

const SPEED = 250.0
const DASHSPEED = 100
const DASH_COOLDOWN = 5000
const DASH_DURATION = 150

var isAnim = false
var dashTimer = 0

func _physics_process(delta: float) -> void:
	var direction := Input.get_axis("backward", "forward")
	var dash = Input.is_action_pressed("dash")
	if direction:
		velocity.x = direction * SPEED
		if dash and dashTimer <= 0:
			velocity.x *= DASHSPEED
			dashTimer = DASH_COOLDOWN
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
