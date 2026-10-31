extends Area2D


func _ready() -> void:
	$Sprite2D.frame = randi()%3
	
	
func _on_body_entered(body: Node2D) ->void:
	remove_from_group("veg")
	if get_tree().get_nodes_in_group("veg").size()==0: 
		get_tree().current_scene.get_node("UI/WinLabel").visible = true
	
	queue_free()
