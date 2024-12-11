extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	var direccion = Input.get_vector("ui_left","ui_right","ui_up","ui_down") 
	var mouse_position = get_global_mouse_position()
	var shoot = direccion - global_position
	var angle = shoot.angle()
	rotation = angle
