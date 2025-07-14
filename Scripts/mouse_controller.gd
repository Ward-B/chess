extends Node2D

var board

signal tile_clicked(tile)

#func _input(event):
#	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
#		_handle_mouse_click(event.position)

func _ready() -> void:
    board = get_parent().get_parent().get_node("BoardManager").get_node("BoardLayer")

func _unhandled_input(event):
    if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
        _handle_mouse_click(event.position)
        
func _handle_mouse_click(position):
    var localPos = board.to_local(get_global_mouse_position())
    var cell = board.local_to_map(localPos)
    if board.get_cell_source_id(cell) != -1:
        print("Clicked on tile at: ", cell)
        tile_clicked.emit(cell)
