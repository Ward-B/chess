extends Node

@export var _chess_piece_scene: PackedScene
@export var _piecesBlack: Array[PackedScene]
@export var _piecesWhite: Array[PackedScene]
@export var _piecesRemoved: Array[PackedScene] = []

const PIECE_TYPES = {
	"rook": preload("res://Resources/GamePieces/RookPieceRes.tres"),
	"knight": preload("res://Resources/GamePieces/KnightPieceRes.tres"),
	"bishop": preload("res://Resources/GamePieces/BishopPieceRes.tres"),
	"queen": preload("res://Resources/GamePieces/QueenPieceRes.tres"),
	"king": preload("res://Resources/GamePieces/KingPieceRes.tres"),
	"pawn": preload("res://Resources/GamePieces/PawnPieceRes.tres")
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_spawn_piece("king", false, Vector2i(24,24))
	_spawn_piece("pawn", true, Vector2i(72,72))
	_spawn_piece("pawn", false, Vector2i(118,118))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _spawn_piece(piece_type: String, isWhite: bool, board_pos: Vector2i = Vector2i(0,0)):
	var piece = _chess_piece_scene.instantiate()
	piece.global_position = board_pos
	var resource = PIECE_TYPES.get(piece_type)
	add_child(piece)
	piece._setup(isWhite, resource)
