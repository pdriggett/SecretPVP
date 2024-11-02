extends Control

@export var over: ColorRect = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	over.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_static_body_2d_mouse_entered() -> void:
	over.visible = true


func _on_static_body_2d_mouse_exited() -> void:
	over.visible = false


func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			print("Cell Clicked")
