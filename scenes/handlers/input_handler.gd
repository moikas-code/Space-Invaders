class_name InputHandler
extends Node2D


func movement_input()-> Vector2:
	var movement_direction : Vector2 = Vector2.ZERO
	movement_direction.x = Input.get_axis("left", "right")
	return movement_direction

func player_attack_input():
	return Input.is_action_just_pressed("attack")
