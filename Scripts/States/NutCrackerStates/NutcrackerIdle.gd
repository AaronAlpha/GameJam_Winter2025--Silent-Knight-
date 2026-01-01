extends State


@export var enemy : CharacterBody2D
@export var idle_move_speed := 10

var player : CharacterBody2D


var move_dir = Vector2(0, 0)
var wander_time : float

func random_wander():
	move_dir = Vector2(  randf_range(-1, 1) , 0)
	wander_time = randf_range(0, 2)
