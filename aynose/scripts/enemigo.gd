extends CharacterBody2D

var speed = 50
var player_chase = false
var player = null
var health = 100
var player_inattack_zone = false

func _ready():
	pass

func _physics_process(delta):
	var anim = $AnimatedSprite2D
	deal_with_damage()
	if player_chase:
		position += (player.position - position)/speed
		anim.play("movimiento")
	else:
		anim.play("iddle")

func _on_detection_area_body_entered(body):
	player = body
	player_chase = true
	
func _on_detection_area_body_exited(body):
	player = null
	player_chase = false

func enemy():
	pass


func _on_attackzone_body_entered(body):
	if body.has_method("damage_effect"):
		player_inattack_zone = true


func _on_attackzone_body_exited(body):
	if body.has_method("damage_effect"):
		player_inattack_zone = false

func deal_with_damage():
	if player_inattack_zone and Global.player_current_attack == true:
		health = health - 20
		print("skeleton health = ", health)
		if health == 0:
			self.queue_free()
