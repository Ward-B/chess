class_name QueenPiece 
extends ChessPiece

func _init() -> void:
	repeats = true

func _determine_moveset():
	moveDirections = [
		Vector2i(1, 1), Vector2i(-1, 1), Vector2i(-1, -1), Vector2i(1, -1),
		Vector2i(1, 0), Vector2i(0, 1), Vector2i(-1, 0), Vector2i(0, -1)]
	attackDirections = moveDirections

#func _determine_moveset():
	#for x in range(-7, 8):
		#for y in range(-7, 8):
			#if !(x==0 && y==0) && (x==y || (x!=0 && y==0) || (x==0 && y!=0)):
				#moveDirections.append(Vector2i(x, y))
	#attackDirections = moveDirections
