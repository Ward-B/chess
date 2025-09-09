class_name HumanPlayer
extends Player

func _startTurn():
	super._startTurn()

func _endTurn():
	super._endTurn()

func _on_select():
	pass
	
func _on_deselect():
	pass

func on_tile_clicked(tile: Vector2i):
	if _is_active:
		print("signal received")
