extends Control

#We need to know what mode we are in so we know how the board should be behaving in that context, so we outline what those modes are
enum BOARD_MODE { PLACEMENT, PLAYER_TURN, ENEMY_TURN }
#We need to store what mode our board is in and we'll default it to the placement mode for now
var mode = BOARD_MODE.PLACEMENT

@export var grid: GridContainer

#We store a preloaded reference to the Cell scene so we can easily instantiate it later
var cellReference = preload("res://scenes/cell.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func reset(columns: int, rows: int) -> void:
	var cellMax: int = columns * rows
	if cellMax > grid.get_child_count():
		var createCellCount = cellMax - grid.get_child_count()
		while createCellCount:
			var newCell = cellReference.instantiate()
			grid.add_child(newCell)
			#We want to make sure we get the signal that a cell has been pressed so we can manage the result based on the game state
			newCell.pressed.connect(cell_pressed.bind(newCell))
			#Decrement the counter once we've created a new cell so we know when to stop
			createCellCount -= 1
			
	#we create a temporary cursor so we can track when we're past how many cells we should have and start deleting them
	#var cursor: int = 0
	#for cell in grid.get_children():
	#	cursor += 1
	#	if cursor > cellMax:
	#		cell.queue_free() 
	#	else:
	#		pass
			
	for cell in grid.get_children():
		cell.clear()
		
	grid.columns = columns

func cell_pressed(cell) -> void:
	if mode == BOARD_MODE.PLACEMENT:
		cell.set_base()
