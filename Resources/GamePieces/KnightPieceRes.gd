class_name KnightPiece 
extends ChessPiece


func _determine_moveset():
	moveDirections = [
		Vector2i(2,-1), Vector2i(2,1), Vector2i(-2,-1), Vector2i(-2,1),
	 	Vector2i(1,2), Vector2i(1,-2),Vector2i(-1,2), Vector2i(-1,-2)]
	attackDirections = moveDirections
