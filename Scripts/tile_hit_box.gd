extends Area2D

@onready var collider_rect = $CollisionShape2D
@onready var highlight_rect = $ColorRect

var _default_modulate: Color
var _selected := false

func _ready():
    _default_modulate = highlight_rect.modulate
    add_to_group("chess_pieces")

func set_selected(value: bool) -> void:
    print("entered tile highlight")
    _selected = value
    if _selected:
        highlight_rect.modulate = Color(1, 0.6, 0.25, 0.75) # mild transparant orange
    else:
        highlight_rect.modulate = _default_modulate
    
