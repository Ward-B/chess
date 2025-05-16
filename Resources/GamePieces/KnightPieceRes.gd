class_name KnightPiece 
extends ChessPiece


func _determine_moveset():
	pass

func _initializeTex(isWhite: bool) -> Texture2D:
	if isWhite:
		return piecesWhite.setRegion(16, 0, 16, 16).get_atlas()
	else:
		return piecesBlack.setRegion(16, 0, 16, 16).get_atlas()
