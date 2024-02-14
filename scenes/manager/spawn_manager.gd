extends Node2D
class_name SpawnManager
@onready var timer = $Timer
@onready var player_node = get_tree().get_first_node_in_group("player")
@export var debug_spawn_player:bool= true
@export var debug_spawn_bunkers:bool= true
@export var debug_spawn_aliens:bool= true
@export var debug_spawn_mothership:bool= true

@export var player_spawn_point:Marker2D
@export var player_scene:PackedScene
@export var spawn_grid_start:Marker2D = null

@export var bunker_spawn_grid_start:Marker2D = null
@export var enemy_spawn_data:Array[Enemy_Spawn_Data]
@export var bunker_spawn_data:PackedScene

@export var mothership_spawn_point:Marker2D
@export var mothership_scene:PackedScene

var column:int = 7;
var row:int = 3;
var max_bunkers:int = 4 
# Called when the node enters the scene tree for the first time.
func _ready():
	var mothership_timer = Timer.new()
	if mothership_timer == null:
		return
	mothership_timer.set_wait_time(randf_range(10,25))
	mothership_timer.autostart = true
	mothership_timer.connect("timeout",on_spawn_mothership)
	add_child(mothership_timer)
	spawn_bunkers()
	spawn_aliens()
	
func _process(delta):
	spawn_player()

func spawn_player():	
	if debug_spawn_player:
		if player_node == null:
			var new_player:Node2D = player_scene.instantiate()
			var entity_container = NodeExtensions.get_entity_container()
			if entity_container == null:
				return
			if player_spawn_point == null:
				return
			entity_container.add_child(new_player)
			new_player.position = player_spawn_point.position
			player_node = get_tree().get_first_node_in_group("player")
			
func on_spawn_mothership()->void:
	if debug_spawn_mothership:
		var new_mothership:Node2D = mothership_scene.instantiate()
		var entity_container = NodeExtensions.get_entity_container()
		if entity_container == null:
			return
		if player_spawn_point == null:
			return
		entity_container.add_child(new_mothership)
		new_mothership.position = mothership_spawn_point.position
		new_mothership.velocity.x = 100

func spawn_aliens():
	if debug_spawn_aliens:
		var row_num = 0
		var row_arr = []
		var column_arr = []
		var col_num = 0
		var entity_container = NodeExtensions.get_entity_container()
		if entity_container == null:
			return
		if enemy_spawn_data == null:
			return
			
		while row_arr.size() < row:
			while column_arr.size() < column:
				var new_enemy:Node2D = load(str(enemy_spawn_data[row_arr.size()].enemy_type.resource_path)).instantiate()
				if new_enemy == null:
					return			
				entity_container.add_child(new_enemy)
				new_enemy.position.x = (spawn_grid_start.position.x + (48 * column_arr.size())+7) 
				new_enemy.position.y = (spawn_grid_start.position.y + (48 * row_arr.size()) + 5)
				new_enemy.points = enemy_spawn_data[row_arr.size()].points
				column_arr.insert(column_arr.size(),col_num)
				col_num +=1
			row_arr.push_back(column_arr.duplicate())
			column_arr = []
			col_num = 0


func spawn_bunkers():
	
	if debug_spawn_bunkers:
		var bunkers:int = 0;
		var entity_container = NodeExtensions.get_entity_container()
		if entity_container == null:
			return
		if enemy_spawn_data == null:
			return
			
		while bunkers < max_bunkers:
			var new_bunker:Bunker = bunker_spawn_data.instantiate()
			if new_bunker == null:
				return			
			entity_container.add_child(new_bunker)
			new_bunker.position.x = (bunker_spawn_grid_start.position.x + (80 * bunkers)) 
			new_bunker.position.y = bunker_spawn_grid_start.position.y
			bunkers +=1
