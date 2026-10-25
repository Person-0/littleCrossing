extends Node2D

@onready var legContainer = $legsContainer
@onready var bg_back = $bg_back
@onready var bg_front = $bg_front
@onready var player = $tinyguy/Camera2D
@onready var audio = $tinyguy/Camera2D/bgm

const LEGPAIR_HEIGHT = -280.0;
const LEGPAIR_ITEM = preload("res://scenes/legpair.tscn")

var bgoffset = Vector2(0,0)

func add_leg(dir, pos):
	var newleg = LEGPAIR_ITEM.instantiate()
	legContainer.add_child(newleg)
	newleg.position = Vector2(pos, LEGPAIR_HEIGHT)
	newleg.changeLegDir(dir)
	newleg.setMoveDir(dir)
	return newleg

func _ready() -> void:
	for i in range(1,18):
		add_leg(randi_range(0, 1), i * 900)
	bgoffset = Vector2(bg_back.position.x, bg_front.position.x)
	audio.play()
	audio.finished.connect(audio.play)

func _process(delta: float) -> void:
	var pposx = player.get_screen_center_position().x - 320
	bg_back.position.x = pposx + bgoffset.x
	bg_front.position.x = (pposx + bgoffset.y) * 0.95
	pass
