extends Node2D

@export var all_tiles: Array[Vector2i]
var board_layer

func _ready():
    board_layer = get_node("BoardLayer")
    all_tiles = board_layer.get_used_cells()
    
