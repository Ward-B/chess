class_name RookPiece 
extends ChessPiece


func _determine_moveset():
	pass

func _initializeTex(isWhite: bool) -> Texture2D:
	if isWhite:
		return piecesWhite.setRegion(32, 0, 16, 16).get_atlas()
	else:
		return piecesBlack.setRegion(32, 0, 16, 16).get_atlas()
