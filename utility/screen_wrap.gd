extends Node
class_name ScreenWrap
@export var window_width = 360
@export var window_height = 640
@onready var screen_size = Vector2(window_width,window_height)

func wrap_screen(entity)->void:
	if entity == null:
		return
	
	if entity.position.x > screen_size.x:
		entity.position.x = 0
	if entity.position.x < 0:
		entity.position.x = screen_size.x
