extends Control
class_name MainMenu
@onready var play_game:Button = $MarginContainer/HBoxContainer/VBoxContainer2/VBoxContainer/play_game
@onready var help = %help


func _ready()->void:
	play_game.pressed.connect(on_button_pressed)
	help.pressed.connect(_to_help)
	
func on_button_pressed():
	get_tree().change_scene_to_packed(load("res://scenes/levels/main.tscn"))

func _to_help():
	get_tree().change_scene_to_packed(load("res://scenes/levels/help.tscn"))
