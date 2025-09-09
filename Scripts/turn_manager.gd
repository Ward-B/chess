extends Node

## Handles turn management.
## Starts a given player's turn, once another has ended.

@export var _curPlayerNum: int = -1
@export var _players: Array[Player] = []

var _player1_white : bool = true

signal turn_started(newPlayer: Player)

func _ready() -> void:
	_start_game()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _start_game():
	for i in range(_players.size()):
		var player := _players[i]
		player.connect("turn_ended", Callable(self, "_on_turn_ended"))
		turn_started.connect(player._on_turn_started)
		#turn_started.connect(Callable(player, "_on_turn_started"))
		player._playerNum = i
		if player._isWhite:
			_curPlayerNum = i
	if _curPlayerNum == -1 and _players.size() > 0:
		_curPlayerNum = 0
	#_players[_curPlayerNum]._startTurn()
	emit_signal("turn_started", _players[_curPlayerNum])

func _on_turn_ended() -> void:
	_curPlayerNum = (_curPlayerNum + 1) % _players.size()
	#_players[_curPlayerNum]._startTurn()
	emit_signal("turn_started", _players[_curPlayerNum])

func is_white_turn() -> bool:
	if _curPlayerNum < 0 or _curPlayerNum >= _players.size():
		return false
	return _players[_curPlayerNum]._isWhite
