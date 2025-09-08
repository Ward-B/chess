class_name RookPiece 
extends ChessPiece


func _ready() -> void:
	repeats = true

func _determine_moveset():
	moveDirections = [Vector2i(1, 0), Vector2i(0, 1), Vector2i(-1, 0), Vector2i(0, -1)]
	attackDirections = moveDirections

#func _determine_moveset():
	#for x in range(-7, 8):
		#if x!=0:
			#moveDirections.append(Vector2i(x, 0))
	#for y in range(-7, 8):
		#if y!=0:
			#moveDirections.append(Vector2i(0, y))
	#attackDirections = moveDirections
