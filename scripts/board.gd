extends Control

@export var grid: GridContainer

var cellReference = preload("res://scenes/cell.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	reset(20,20)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func reset(columns: int, rows: int) -> void:
	var cellMax: int = columns * rows
	if cellMax > grid.get_child_count():
		var createCellCount = cellMax - grid.get_child_count()
		while createCellCount:
			print(createCellCount)
			var newCell = cellReference.instantiate()
			grid.add_child(newCell)
			createCellCount -= 1
	#we create a temporary cursor so we can track when we're past how many cells we should have and start deleting them
	#var cursor: int = 0
	#for cell in grid.get_children():
	#	cursor += 1
	#	if cursor > cellMax:
	#		cell.queue_free() 
	#	else:
	#		pass
			
	grid.columns = columns
