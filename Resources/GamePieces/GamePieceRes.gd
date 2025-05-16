class_name ChessPiece
extends Resource

enum Type {PAWN, KNIGHT, ROOK, BISHOP, QUEEN, KING}

@export var type: Type
@export var moveDirections: Array[Vector2i]

var piecesWhite: AtlasTexture
var piecesBlack: AtlasTexture
var texture: Texture2D


func _init() -> void:
	piecesBlack = preload("res://Assets/blackpieces.tres")
	piecesWhite = preload("res://Assets/whitepieces.tres")
	
func _setup(in_isWhite = true):
	_determine_moveset()
	#texture = _initializeTex(in_isWhite)


func _determine_moveset():
	pass
	
func _initializeTex(isWhite: bool):
	pass
	#var texlocation = 0
	#match Type:
		#Type.PAWN: texlocation = 0
		#Type.KNIGHT: texlocation = 16
		#Type.ROOK: texlocation = 32
		#Type.BISHOP: texlocation = 48
		#Type.QUEEN: texlocation = 64
		#Type.KING: texlocation = 80
