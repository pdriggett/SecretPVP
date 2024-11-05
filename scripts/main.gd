extends Node2D

@export var join_game_button: Button = null

var board = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	board = $HBoxContainer/Board
	board.reset(5,5)
	join_game_button.pressed.connect(MultiplayerManager.connect_to_server)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_reset_button_pressed() -> void:
	board.reset(10,10)
