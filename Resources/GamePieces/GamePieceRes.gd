class_name ChessPiece
extends Resource

enum Type {PAWN, KNIGHT, ROOK, BISHOP, QUEEN, KING}

@export var type: Type
@export var moveDirections: Array[Vector2i]

var piecesWhite: AtlasTexture
var piecesBlack: AtlasTexture
var texture: Texture2D
    
func _setup(in_isWhite = true):
    _determine_moveset()


func _determine_moveset():
    pass
