extends CharacterBody2D
class_name BulletEntity

@export var speed:int = 50
# Called when the node enters the scene tree for the first time.
func _ready():
	set_velocity(Vector2(0,-speed))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move_and_slide()
	
