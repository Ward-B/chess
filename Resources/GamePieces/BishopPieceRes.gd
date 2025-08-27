class_name BishopPiece 
extends ChessPiece


func _determine_moveset():
	for x in range(-7, 8):
		for y in range(-7, 8):
			if x == 0 && y == 0:
				continue
			elif x == y:
				moveDirections.append(Vector2i(x, y))
	attackDirections = moveDirections
