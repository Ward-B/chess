class_name ChessPiece
extends Resource

enum Type {PAWN, KNIGHT, BISHOP, ROOK, QUEEN, KING}

@export var type: Type
@export var location: Vector2i
@export var isWhite: bool
@export var moveDirections: Array[Vector2i]


func _init(itype = Type.PAWN, ilocation = [-1,-1], iisWhite = true, imoveDirections = null) -> void:
	type = itype
	location = ilocation
	isWhite = iisWhite
	moveDirections = imoveDirections
	
func _determine_moveset():
	pass
