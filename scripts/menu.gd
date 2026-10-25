extends Control

@onready var readyBtn = $Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	readyBtn.pressed.connect(on_play)

func on_play() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn")
