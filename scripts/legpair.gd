extends Node2D

@onready var leg1 = $leg1
@onready var leg2 = $leg2

const WALK_HEIGHT = 200
const WALK_STEP = 0.025
const WALK_ANGLE_MAX = 10
const WALK_SPEED = 0.6

var xpos = 0

func leg_height(num, legnum):
	var val = (sin(num * WALK_STEP + (legnum * PI))) * WALK_HEIGHT
	if val < 0:
		val = 0
	return val
func leg_rot(num, legnum):
	return sin(num * WALK_STEP * 2 + (legnum * PI/2)) * WALK_ANGLE_MAX

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var stepnum = Time.get_ticks_msec() * WALK_STEP
	leg1.position.y = -leg_height(stepnum, 0)
	leg2.position.y = -leg_height(stepnum, 1)
	var moveLeg
	if leg1.position.y == 0:
		moveLeg = leg2
	else:
		moveLeg= leg1
	moveLeg.position.x += WALK_SPEED
	moveLeg.rotation = deg_to_rad(leg_rot(stepnum, 0))

func changeLegDir(dir):
	for item in find_children("*", "Sprite2D", true, false):
		item.flip_h = dir
