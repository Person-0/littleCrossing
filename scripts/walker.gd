extends Node2D

const LEGPAIR_HEIGHT = -280.0;
const LEGPAIR_ITEM = preload("res://scenes/legpair.tscn")

func add_leg(dir, pos):
	var newleg = LEGPAIR_ITEM.instantiate()
	add_child(newleg)
	newleg.position = Vector2(pos, LEGPAIR_HEIGHT)
	newleg.changeLegDir(dir)
	return newleg

func _ready() -> void:
	var newleg = add_leg(1, 800)

func _process(delta: float) -> void:
	pass
