extends CharacterBody2D

var direction: Vector2 = Vector2 (1, 0)
var speed: int = 80

func _physics_process(delta: float) -> void:
	direction = Input. get_vector("left", "right","up", "down" )
	velocity = direction * speed 
	move_and_slide()
	
	
	
