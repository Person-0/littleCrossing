extends CharacterBody2D

@onready var sprite = $AnimatedSprite2D

const SPEED = 250.0
const DASHSPEED_GAIN = 600.0
const DASH_COOLDOWN = 2500
const DASH_DURATION_MS = 150

var isAnim = false

var dashTimer = 0
var isDashing = false
var dashDir = 0
var canDash = true
var dashCooldownTimer = 0

func _physics_process(delta: float) -> void:
	var deltaMS = delta * 1000
	var direction := Input.get_axis("backward", "forward")
	var dashNow = Input.is_action_pressed("dash")
	
	if isDashing:
			dashTimer -= deltaMS
			if dashTimer <= 0:
				dashTimer = 0
				isDashing = false
				if isAnim:
					sprite.play("walk")
				else:
					sprite.play("idle")
			else:
				velocity.x += dashDir * DASHSPEED_GAIN
				sprite.play("dashframe")
				sprite.flip_h = true if dashDir < 0 else false
				
	elif direction:
		velocity.x = direction * SPEED
		
		if not isAnim:
			isAnim = true
			sprite.play("walk")
		sprite.flip_h = true if direction < 0 else false
		
		if dashNow and canDash:
			dashTimer = DASH_DURATION_MS
			dashCooldownTimer = DASH_COOLDOWN
			isDashing = true
			dashDir = direction
			canDash = false
			
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if isAnim:
			isAnim = false
			sprite.play("idle")
			
	if not canDash:
		dashCooldownTimer -= deltaMS
		if dashCooldownTimer <= 0:
			dashCooldownTimer = 0
			canDash = true
			
	move_and_slide()
