extends MainMenu
class_name HelpMenu

func _ready():
	%menu.pressed.connect(_to_menu)
	
func _to_menu()->void:
	get_tree().change_scene_to_packed(load("res://scenes/levels/main_menu.tscn"))
