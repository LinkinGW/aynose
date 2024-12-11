extends CharacterBody2D


const SPEED = 50.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	var direccion = Input.get_vector("ui_left","ui_right","ui_up","ui_down") 
	if direccion:
		$Animaciones.play("movimiento")
	velocity = direccion * SPEED
	move_and_slide()
	
