class_name Player
extends Node2D

signal turn_ended

@export var _isWhite: bool = false
@export var _playerNum: int = -1
@export var _chessPieces: Array[ChessPiece] = []
var _selectedPiece: ChessPiece = null
var _is_active: bool = false

@onready var _mouse_controller: Node = get_node_or_null("MouseController")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _startTurn():
	_is_active = true
	if _mouse_controller:
		_mouse_controller.set_process_input(true)
		_mouse_controller.set_process_unhandled_input(true)

func _endTurn():
	_is_active = false
	_selectedPiece = null
	if _mouse_controller:
		_mouse_controller.set_process_input(false)
		_mouse_controller.set_process_unhandled_input(false)
	turn_ended.emit()

func _on_turn_started(player: Player):
	if player._playerNum == _playerNum:
		print("Player ", player._playerNum+1, "'s turn started.")
		_startTurn()
	else:
		print("Not player ", _playerNum+1, "'s turn.")
