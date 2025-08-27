class_name PawnPiece 
extends ChessPiece

func _determine_moveset():
	moveDirections = [Vector2i(0,-1)]
	attackDirections = [Vector2i(-1,-1), Vector2i(1,-1)]
