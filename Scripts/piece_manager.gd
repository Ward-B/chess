extends Node

@export var _chess_piece_scene: PackedScene
@export var _piecesBlack: Array[PackedScene]
@export var _piecesWhite: Array[PackedScene]
@export var _piecesRemovedBlack: Array[PackedScene] = []
@export var _piecesRemovedWhite: Array[PackedScene] = []

var _board
var _pieceLocations = {} # empty dictionary
var _selected_piece = null
@onready var turn_manager = get_node("../TurnManager")

signal piece_selected(move_cells,attackable_cells)

const PIECE_TYPES = {
	"rook": preload("res://Resources/GamePieces/RookPieceRes.tres"),
	"knight": preload("res://Resources/GamePieces/KnightPieceRes.tres"),
	"bishop": preload("res://Resources/GamePieces/BishopPieceRes.tres"),
	"queen": preload("res://Resources/GamePieces/QueenPieceRes.tres"),
	"king": preload("res://Resources/GamePieces/KingPieceRes.tres"),
	"pawn": preload("res://Resources/GamePieces/PawnPieceRes.tres"),
	"none": 0
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_board = get_parent().get_node("BoardManager")
	_setupPiecesDict()
	_setupTeams(true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _spawn_piece(piece_type: String, isWhite: bool, in_board_pos: Vector2i = Vector2i(0,0)):
	var piece = _chess_piece_scene.instantiate()
	var board_pos = Vector2i (in_board_pos.x*48+24, in_board_pos.y*48+24)
	piece.global_position = board_pos
	var resource = PIECE_TYPES.get(piece_type)
	add_child(piece)
	piece._setup(isWhite, resource)
	_pieceLocations[in_board_pos] = [piece_type, isWhite]

func _setupPiecesDict():
	for cell in _board.all_tiles:
		_pieceLocations[cell] = ["none", true] # string name of piece, and whether it's white

# Warning: because of #effort, different directions won't be taken into consideration when making pawn movement
func _setupTeams(isWhite: bool):
	for i in 8:
		_spawn_piece("pawn", isWhite, Vector2i(i, 1))
		_spawn_piece("pawn", !isWhite, Vector2i(i, 6))
		if i == 0 or i == 7: 
			_spawn_piece("rook", isWhite, Vector2i(i, 0)) 
			_spawn_piece("rook", !isWhite, Vector2i(i, 7)) 
		if i == 1 or i == 6: 
			_spawn_piece("knight", isWhite, Vector2i(i, 0)) 
			_spawn_piece("knight", !isWhite, Vector2i(i, 7)) 
		if i == 2 or i == 5:
			_spawn_piece("bishop", isWhite, Vector2i(i, 0)) 
			_spawn_piece("bishop", !isWhite, Vector2i(i, 7)) 
		if i == 3: 
			_spawn_piece("king", isWhite, Vector2i(i, 0))
			_spawn_piece("king", !isWhite, Vector2i(i, 7))
		if i == 4: 
			_spawn_piece("queen", isWhite, Vector2i(i, 0))
			_spawn_piece("queen", !isWhite, Vector2i(i, 7))

func _select_piece(piece):
	if _selected_piece == piece:
		_deselect_current()
		return
	_deselect_current()
	_selected_piece = piece
	_selected_piece.tile_hit_box.set_selected(true)
	_form_highlight_data(_selected_piece)
	
func _deselect_current():
	_board.clear_highlights()
	if _selected_piece:
		_selected_piece.tile_hit_box.set_selected(false)
		_selected_piece = null

func _form_highlight_data(selected_piece):
	var localPiecePos = _board.get_node("BoardLayer").to_local(selected_piece.position)
	var cellPiece = _board.get_node("BoardLayer").local_to_map(localPiecePos) # cell where the piece is
	var result = _calc_move_attack_tiles(cellPiece, selected_piece)
	#for offset: Vector2i in selected_piece.pieceData.moveDirections:
		#var target = cellPiece+offset
		#if target.x in range(8) and target.y in range(8):
			#if _pieceLocations.has(target) and _pieceLocations[target][0] == "none":
				#reachable_tiles.append(target)
	#for offset: Vector2i in selected_piece.pieceData.attackDirections:
		#var target = cellPiece+offset
		#if target.x in range(8) and target.y in range(8):
			#if _pieceLocations.has(target) and _pieceLocations[target][0] != "none":
				#if _pieceLocations[target][1] != selected_piece.isWhite:
					#attackable_tiles.append(target)
					
	piece_selected.emit(result["moves"], result["attacks"]) # should provide the tiles to be highlighted

func _calc_move_attack_tiles(currentPos, selectedPiece):
	var attackable_tiles = []
	var reachable_tiles = []
	for offset: Vector2i in selectedPiece.pieceData.moveDirections:
		var target = currentPos+offset
		if selectedPiece.pieceData.repeats:
			while _pieceLocations.has(target):
				if _pieceLocations[target][0] == "none":
					reachable_tiles.append(target)
					target = target + offset
				elif (_pieceLocations[target][0] != "none" and 
					_pieceLocations[target][1] != selectedPiece.isWhite):
					attackable_tiles.append(target)
					break
				else:
					break
		else:
			if _pieceLocations.has(target):
				if _pieceLocations[target][0] == "none":
					reachable_tiles.append(target)
				elif (_pieceLocations[target][0] != "none" and 
					_pieceLocations[target][1] != selectedPiece.isWhite):
					attackable_tiles.append(target)
	var result = {"moves":reachable_tiles,"attacks":attackable_tiles}
	return result

func tile_to_position(tile: Vector2i):
	var board_layer := _board.get_node("BoardLayer") as TileMapLayer
	var local := board_layer.map_to_local(tile)
	#local += Vector2(board_layer.tile_set.tile_size) / 2
	return board_layer.to_global(local) 

func _on_tile_clicked(tile: Vector2i):
	# to-do: either deselect or move selected piece if allowed
	var current_player = turn_manager._players[turn_manager._curPlayerNum]
	if (_board.highlight_layer.get_used_cells().has(tile) 
	and _selected_piece and _pieceLocations[tile][0] == "none"):
		var localPiecePos = _board.get_node("BoardLayer").to_local(_selected_piece.position)
		var curPos = _board.get_node("BoardLayer").local_to_map(localPiecePos)
		_pieceLocations[tile][0] = _pieceLocations[curPos][0] # update dict
		_pieceLocations[tile][1] = _pieceLocations[curPos][1] # update dict
		_pieceLocations[curPos][0] = "none"
		_pieceLocations[curPos][1] = true
		_selected_piece._move(tile_to_position(tile))
		current_player._endTurn()
	else:
		_deselect_current()


func _on_piece_clicked(piece: Variant) -> void:
	# to-do: either allow selection of an owned piece, attack an opposing one, or de/reselect
	#_select_piece(piece) 
	var current_player = turn_manager._players[turn_manager._curPlayerNum]
	if piece.isWhite == current_player._isWhite:
		_select_piece(piece)
	elif _selected_piece:
		# TODO: handle attack on opposing piece
		pass
