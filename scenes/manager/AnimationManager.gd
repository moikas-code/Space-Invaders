extends Node2D

class_name AnimaitionManager
@onready var explosion_animaiton = %explosion_animaiton as AnimatedSprite2D
func _ready()->void:
	pass
	
	
func on_destroy(value)->void:
	explosion_animaiton.position = value.position
	explosion_animaiton.animation="explode"
	if explosion_animaiton.frame_progress == 7:
		explosion_animaiton.animation="default"
	
