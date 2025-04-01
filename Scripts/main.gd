extends Node2D

## Main script; takes care of connecting signals, and initializing the important bits


func _ready() -> void:
	$Board/BoardLayer.tile_clicked.connect($HumanPlayer.on_tile_clicked)
	pass # Replace with function body.
