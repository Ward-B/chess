class_name BishopPiece 
extends ChessPiece


func _determine_moveset():
	pass

func _initializeTex(isWhite: bool) -> Texture2D:
	if isWhite:
		return piecesWhite.setRegion(48, 0, 16, 16).get_atlas()
	else:
		return piecesBlack.setRegion(48, 0, 16, 16).get_atlas()
