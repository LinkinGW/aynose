extends Area2D

# Velocidad de la bola de fuego
@export var speed = 300
# Distancia máxima antes de desaparecer
@export var max_distance = 300

# Posición inicial
var start_position
# Flag para saber si debe moverse
var moving = false
# Flag para saber si está explotando
var exploding = false

func _ready():
	var anim = $fireball_sprite
	anim.play("creation")
	start_position = position

func _process(delta):
	if moving:
		# Mover la bola de fuego en su dirección actual
		position += Vector2(cos(rotation), sin(rotation)) * speed * delta

		# Comprobar si ha superado la distancia máxima
		if position.distance_to(start_position) > max_distance:
			stop_and_explode()
	elif exploding:
		check_explosion_finished()

func start_moving():
	moving = true
	var anim = $fireball_sprite
	anim.play("shoot")

func stop_and_explode():
	moving = false  # Detener el movimiento
	exploding = true
	var anim = $fireball_sprite
	anim.play("explote")

func check_explosion_finished():
	var anim = $fireball_sprite
	# Obtener el número total de frames de la animación actual
	var total_frames = anim.sprite_frames.get_frame_count(anim.animation)
	if anim.frame == total_frames - 1:
		queue_free()  # Eliminar la bola de fuego
