extends Node2D

@onready var legContainer = $legsContainer
@onready var bg_back = $bg_back
@onready var bg_front = $bg_front
@onready var player = $tinyguy/Camera2D

const LEGPAIR_HEIGHT = -280.0;
const LEGPAIR_ITEM = preload("res://scenes/legpair.tscn")

var bgoffset = Vector2(0,0)

func add_leg(dir, pos):
	var newleg = LEGPAIR_ITEM.instantiate()
	legContainer.add_child(newleg)
	newleg.position = Vector2(pos, LEGPAIR_HEIGHT)
	newleg.changeLegDir(dir)
	return newleg

func _ready() -> void:
	var newleg = add_leg(1, 800)
	bgoffset = Vector2(bg_back.position.x, bg_front.position.x)

func _process(delta: float) -> void:
	var pposx = player.get_screen_center_position().x - 320
	bg_back.position.x = pposx + bgoffset.x
	bg_front.position.x = (pposx + bgoffset.y) * 0.95
	pass
