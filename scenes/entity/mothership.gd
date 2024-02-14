extends CharacterBody2D
class_name MotherShip

@export var points = 10
@export var max_speed = 100
var speed = 50
var direction = Vector2(-1, 0)  # Move right initially


func _process(delta):
	velocity = direction * speed * delta
	var new_position = position + velocity
	# Check for screen edge
	if new_position.x < -640 or new_position.x > 640:
		if speed < max_speed:
			speed *= 1.15
	else:
		position = new_position


func _on_hitbox_body_entered(body):
	if body.is_in_group('bullet') :
		body.queue_free()
		self.queue_free()
		
		SignalBus.emit_on_enemy_death(points)
		SignalBus.emit_on_destroyed()
