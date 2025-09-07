class_name Player
extends Node2D

signal turn_ended

@export var _isWhite: bool = false
@export var _playerNum: int = -1
@export var _chessPieces: Array[ChessPiece] = []
var _selectedPiece: ChessPiece = null


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _startTurn():
	pass

func _endTurn():
	pass
