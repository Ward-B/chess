extends Node2D

@export var pieceData: ChessPiece

@onready var sprite = $Sprite2D
@onready var tile_hit_box = $TileHitBox

var isWhite: bool
var diepeZucht: bool = false

func _ready():
	pass
	#print("entered ready")
	#if pieceData:
	#	pieceData._setup(false)
	#	sprite.texture = pieceData.texture
	#	print("sprite loaded")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _setup(in_isWhite: bool, in_pieceData: ChessPiece):
	isWhite = in_isWhite
	if(!isWhite && in_pieceData.type == pieceData.Type.PAWN): # zucht...
		pieceData = in_pieceData.duplicate()
		pieceData._setup(isWhite)
		for i in range(pieceData.moveDirections.size()):
			pieceData.moveDirections[i] *= -1 # this oughta 'invert' the possible moves
		for i in range(pieceData.attackDirections.size()):
			pieceData.attackDirections[i] *= -1 # this oughta 'invert' the possible moves
	else:
		pieceData = in_pieceData
		pieceData._setup(isWhite)
	#sprite.texture = pieceData.texture
	_determineTex()


func _determineTex():
	if isWhite:
		sprite.texture = preload("res://Assets/whitepieces.tres")
	else:
		sprite.texture = preload("res://Assets/blackpieces.tres")
	sprite.region_enabled = true
	sprite.set_region_rect(Rect2(pieceData.type*16, 0, 16, 16))

func _move(newLoc:Vector2i):
	move_local_x(newLoc.x)
	move_local_y(newLoc.y)
