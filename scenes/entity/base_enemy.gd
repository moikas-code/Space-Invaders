extends CharacterBody2D

class_name BaseEnemy


@onready var screen_wrap = %ScreenWrap
@onready var sprite_2d = $Sprite2D
@onready var left = $left
@onready var right = $right
@onready var screen_limit = 360
@export  var bullet_scene:PackedScene = null
#@onready var attack_timer:Timer = $attack_timer
@export var points:int = 10
@export var max_speed:int = 100
@export var max_bombs:int = 3
var speed:int = 50
var direction = Vector2(1, 0)  # Move right initially
var down_shift = 25  # How much the enemy moves down when hitting an edge

func _ready():
	_attack_timer()
	set_process(true)
	
func _process(delta):
	handle_grid_movement(delta)

func handle_grid_movement(delta)->void:
	velocity = direction * speed * delta
	var new_position = position + velocity
	# Check for screen edge
	if new_position.x < 0 or new_position.x > screen_limit:
		direction.x *= -1  # Reverse direction
		position.y += down_shift  # Shift down
		if speed < max_speed:
			speed *= 1.15
		# Ensure the enemy stays within the screen bounds
		position.x = clamp(position.x, 0, screen_limit)
	else:
		position = new_position
			
func handle_attack():
	if NodeExtensions.get_size_of_group("bomb") < max_bombs:
		if left.is_colliding() or right.is_colliding():
			return
			
		var entity_container:Node2D = NodeExtensions.get_entity_container()
		if entity_container == null:
			return
			
		if bullet_scene == null:
			return
		var new_bullet = bullet_scene.instantiate()
		
		entity_container.add_child(new_bullet)
		SignalBus.emit_on_enemy_shoot()
		new_bullet.position.y = position.y + 48
		new_bullet.position.x = position.x

func _attack_timer():
		# Set up the timer
	var attack_timer = Timer.new()
	if attack_timer == null:
		return
	attack_timer.set_wait_time(randf_range(1.0,10.0))  # Attack every 5 seconds
	attack_timer.autostart = true
	attack_timer.connect("timeout",handle_attack)
	add_child(attack_timer)

func _on_hitbox_body_entered(body):
	if body == null:
		return
	if body.is_in_group("bullet"):
		body.queue_free()
		self.queue_free()
		SignalBus.emit_on_enemy_death(points)
		SignalBus.emit_on_destroyed()
