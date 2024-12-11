extends Node2D

var current_weapon = "sword"
onready var animation_player = $AnimationPlayer
onready var weapon_sprite = $WeaponSprite

func _ready():
	change_weapon(current_weapon)

func change_weapon(weapon_name):
	current_weapon = weapon_name
	match current_weapon:
		"sword":
			weapon_sprite.texture = preload("res://path_to_pistol_sprite.png")
			animation_player.play("sword_animation")
		"rifle":
			weapon_sprite.texture = preload("res://path_to_rifle_sprite.png")
			animation_player.play("rifle_animation")
		# Añade más armas y animaciones según sea necesario
