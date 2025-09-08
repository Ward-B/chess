class_name BishopPiece 
extends ChessPiece

func _ready() -> void:
	repeats = true

func _determine_moveset():
	moveDirections = [Vector2i(1, 1), Vector2i(-1, 1), Vector2i(-1, -1), Vector2i(1, -1)]
	attackDirections = moveDirections

#func _determine_moveset():
	#for x in range(-7, 8):
		#for y in range(-7, 8):
			#if x == 0 && y == 0:
				#continue
			#elif x == y or x == -y:
				#moveDirections.append(Vector2i(x, y))
	#attackDirections = moveDirections
