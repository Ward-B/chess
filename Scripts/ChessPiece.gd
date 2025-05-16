extends Node2D

@export var pieceData: ChessPiece
@onready var sprite = $Sprite2D

var isWhite: bool

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
	pieceData = in_pieceData
	isWhite = in_isWhite
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
