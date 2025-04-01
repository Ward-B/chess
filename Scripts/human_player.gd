extends Player


func _on_select():
	pass
	
func _on_deselect():
	pass

func on_tile_clicked(tile: Vector2i):
	print("signal received")
