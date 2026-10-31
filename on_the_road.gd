extends Node2D

var direction : Vector2 = Vector2 (2, 1)
var speed = 5

func _physics_process(_delta: float) -> void:
	if Input.is_action_pressed('right'):
		position += direction * speed
 
