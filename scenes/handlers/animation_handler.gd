class_name AnimationHandler
extends Node2D
@export var sprite:AnimatedSprite2D
@onready var animated_sprite_2d: AnimatedSprite2D = sprite


func _animations(character_body:CharacterBody2D,isJumping):
	#Animations
	if(animated_sprite_2d.animation=="attack" and animated_sprite_2d.frame<=7):
		return
	
	if character_body.is_on_floor():
		if (character_body.velocity.x >1 or character_body.velocity.x  <-1):
			animated_sprite_2d.animation= "run"
		else:
			animated_sprite_2d.animation= "default"
	# jump
	if  isJumping and character_body.is_on_floor():
			animated_sprite_2d.animation= "jump"
