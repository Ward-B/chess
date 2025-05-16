class_name PawnPiece 
extends ChessPiece


func _determine_moveset():
	pass

func _initializeTex(isWhite: bool) -> Texture2D:
	if isWhite:
		piecesWhite.set_region(Rect2(0, 0, 16, 16))
		return piecesWhite
	else:
		piecesBlack.set_region(Rect2(0, 0, 16, 16))
		return piecesBlack
