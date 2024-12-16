extends CharacterBody2D


const SPEED = 50.0
var fireball_scene = preload("res://fireball.tscn")
var current_fireball = null



func _input(event):
	if event is InputEventMouseButton:
		if Input.is_action_just_pressed("left_click"):
			prepare_fireball()
		elif not Input.is_action_pressed("left_click"):
			release_fireball()


func prepare_fireball():
	# Instanciar la bola de fuego
	var fireball = fireball_scene.instantiate()
	
	# Obtener la posición global de la mano
	var hand_global_position = $hand.global_position
	
	# Posicionar la bola de fuego en la posición de la mano
	fireball.position = hand_global_position
	
	# Establecer la dirección de la bola de fuego
	fireball.rotation = $hand.rotation
	
	# Añadir la bola de fuego a la escena actual
	get_tree().current_scene.add_child(fireball)

func release_fireball():
	if current_fireball:
		# Comenzar el movimiento de la bola de fuego
		current_fireball.start_moving()
		current_fireball = null

func _physics_process(delta):
	
	var direccion = Input.get_vector("ui_left","ui_right","ui_up","ui_down") 
	if direccion:
		$Animaciones.play("movimiento")
	velocity = direccion * SPEED
	move_and_slide()
	$Camera2D.zoom = Vector2(1 / scale.x, 1 / scale.y)
	
