extends Area2D

# Velocidad de la bola de fuego
@export var speed = 300
# Distancia máxima antes de desaparecer
@export var max_distance = 300

# Posición inicial
var start_position
# Flag para saber si debe moverse
var moving = false

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

func start_moving():
	moving = true
	var anim = $fireball_sprite
	anim.play("shoot")

func stop_and_explode():  
	moving = false  # Detener el movimiento
	var anim = $fireball_sprite  
	anim.play("explote")
	# Esperar a que la animación termine antes de liberar el nodo
	anim.connect("animation_finished", Callable(self, "_on_Explosion_finished"))

func _on_Explosion_finished(name):
	if name == "explote":
		queue_free()  # Eliminar la bola de fuego
