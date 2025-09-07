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
	
func _on_piece_manager_piece_selected(reachable_tiles, attackable_tiles) -> void:
	return
	#to-do: remove this stuff, i think, and accept more direct input for highlighting
	#var localPiecePos = $BoardLayer.to_local(selected_piece.location)
	#var cellPiece = $BoardLayer.local_to_map(localPiecePos) # cell where the piece is
	#attackable_tiles = []
	#reachable_tiles = []
	#for i: Vector2i in selected_piece.pieceData.moveDirections:
	#	if i.x in range(8) and i.y in range(8):
	#		reachable_tiles.append(cellPiece+i) # should append the moveDir to the piece's cell
	#for i: Vector2i in selected_piece.pieceData.attackDirections:
	#	if i.x in range(8) and i.y in range(8):
	#		reachable_tiles.append(cellPiece+i)
