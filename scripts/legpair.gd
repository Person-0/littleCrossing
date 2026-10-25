extends Node2D

@onready var leg1 = $leg1
@onready var leg2 = $leg2

const WALK_HEIGHT = 300
const WALK_STEP = 0.02
const WALK_ANGLE_MAX = 35

var xpos = 0

func leg_height(num, legnum):
	return abs(sin(num * WALK_STEP + (legnum * PI/2))) * WALK_HEIGHT
func leg_rot(num, legnum):
	return sin(num * WALK_STEP * 2 + (legnum * PI)) * WALK_ANGLE_MAX

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var stepnum = Time.get_ticks_msec() * WALK_STEP
	leg1.position.y = -leg_height(stepnum, 0)
	leg1.rotation = deg_to_rad(leg_rot(stepnum, 0))
	leg2.position.y = -leg_height(stepnum, 1)
	leg2.rotation = deg_to_rad(leg_rot(stepnum, 1))
	position.x = xpos
	xpos += 1

func changeLegDir(dir):
	for item in find_children("*", "Sprite2D", true, false):
		item.flip_h = dir
