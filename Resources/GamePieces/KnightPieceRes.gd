class_name KnightPiece 
extends ChessPiece


func _determine_moveset():
    pass

func _initializeTex(isWhite: bool) -> Texture2D:
    if isWhite:
        piecesWhite.set_region(Rect2(16, 0, 16, 16))
        return piecesWhite
    else:
        piecesBlack.set_region(Rect2(16, 0, 16, 16))
        return piecesBlack
