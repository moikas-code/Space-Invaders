extends CharacterBody2D

class_name PlayerEntity
@onready var input_handler:InputHandler = %InputHandler
@onready var movement_handler:MovementHandler = %MovementHandler
@onready var screen_wrap = %ScreenWrap
@export  var bullet_scene:PackedScene = null
@onready var sprite_2d = $Sprite2D

@export var game_manger:PackedScene

var max_bullets = 1

func _process(delta):
		screen_wrap.wrap_screen(self)
		handle_attack()

func _physics_process(delta)->void:
	movement_handler.movement_handler(self, input_handler.movement_input(), delta)
	move_and_slide()


func handle_attack()->void:
	var  bullet_number= NodeExtensions.get_size_of_group('bullet')
	if input_handler.player_attack_input() and bullet_number < max_bullets:
		var entity_container:Node2D = NodeExtensions.get_entity_container()
		if entity_container == null:
			return
		if bullet_scene == null:
			return
		var new_bullet = bullet_scene.instantiate()
		entity_container.add_child(new_bullet)
		SignalBus.emit_on_ship_shoot()
		new_bullet.position.y = position.y - 48
		new_bullet.position.x = position.x
		


func _on_hitbox_body_entered(body) -> void:
	if body == null:
		return
	if body.is_in_group("bomb"):
		sprite_2d.animation="explode"
		body.queue_free()
		self.queue_free()
		SignalBus.emit_on_player_death()
		SignalBus.emit_on_destroyed()

