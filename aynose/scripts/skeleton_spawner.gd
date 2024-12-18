extends Node2D

@onready var main = get_node("/root/Main")

var skeleton_scene := preload("res://escenas/enemigos/skeleton.tscn")
var spawn_points := []

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in get_children():
		if i is Marker2D:
			spawn_points.append(i)


func _on_timer_timeout():
	var spawn = spawn_points[randi() % spawn_points.size()]
	
	var skeleton = skeleton_scene.instantiate()
	skeleton.position = spawn.position
	main.add_child(skeleton)
