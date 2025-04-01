extends Node

## Handles turn management.
## Starts a given player's turn, once another has ended.

@export var _curPlayerNum: int = -1
@export var _players: Array[Player] = []


signal turn_started(newPlayer: Player)

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
