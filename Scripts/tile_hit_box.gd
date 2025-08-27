extends Area2D

@onready var collider_rect = $CollisionShape2D
@onready var highlight_rect = $ColorRect

var _default_color: Color
var _selected := false

func _ready():
	_default_color = highlight_rect.color
	highlight_rect.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_to_group("chess_pieces")

func set_selected(value: bool) -> void:
	_selected = value
	if _selected:
		highlight_rect.color = Color(1, 0.6, 0.25, 0.50) # mild transparant orange
	else:
		highlight_rect.color = _default_color
	
