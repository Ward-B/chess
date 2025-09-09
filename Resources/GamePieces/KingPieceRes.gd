class_name KingPiece 
extends ChessPiece

func _determine_moveset():
	for x in [-1, 0, 1]:
		for y in [-1, 0, 1]:
			if x == 0 and y == 0:
				continue
			moveDirections.append(Vector2i(x, y))
	attackDirections = moveDirections
