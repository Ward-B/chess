extends Node2D

@export var all_tiles: Array[Vector2i]
@export var attackable_tiles: Array[Vector2i] = []
@export var reachable_tiles: Array[Vector2i] = []
var board_layer

func _ready():
	board_layer = get_node("BoardLayer")
	all_tiles = board_layer.get_used_cells()
	
func clear_highlights():
	pass

func highlight_reachable_tiles(tiles: Array[Vector2i]):
	pass
	
func highlight_attackable_tiles(tiles: Array[Vector2i]):
	pass
