class_name RookPiece 
extends ChessPiece


func _determine_moveset():
	for x in range(-7, 8):
		if x!=0:
			moveDirections.append(Vector2i(x, 0))
	for y in range(-7, 8):
		if y!=0:
			moveDirections.append(Vector2i(0, y))
	attackDirections = moveDirections
