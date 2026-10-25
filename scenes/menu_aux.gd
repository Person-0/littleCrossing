extends CanvasLayer

@onready var textItem = $Control/ColorRect/RichTextLabel
@onready var readyBtn = $Control/Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	textItem.text = textItem.text.replace("REPLACE_ME", global.GAME_status)
	readyBtn.pressed.connect(on_retry)

func on_retry() -> void:
	get_tree().change_scene_to_file("res://scenes/menu_main.tscn")
