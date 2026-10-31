extends ProgressBar
@onready var icon: TextureRect =$"../HealthIcon"
var fill_style:= StyleBoxFlat.new()
var maize_left = 10

func _ready():
	add_theme_stylebox_override("fill", fill_style)
	update_color()
	
func change_health(amount):
	value +=amount
	update_color ()
	if amount > 0:
		flash (Color.GREEN)
	else:
		flash (Color. RED) 
		shake_icon () 
		if value <= 0:
			game_over()
	
func update_color ():
	if value > 70:
		fill_style.bg_color = Color.GREEN
	elif value > 40:
		fill_style.bg_color = Color.YELLOW
	elif value > 20:
		fill_style.bg_color = Color(0.45, 0.05, 0.15, 1.0)
	else:
		fill_style.bg_color = Color.RED
	if value <= 20:
		icon.modulate = Color(1, 0.5, 0.5)
	else:
		icon.modulate = Color.WHITE

func flash(color):
		modulate = color
		create_tween().tween_property(self, "modulate", Color.WHITE, 0.3)
			
func shake_icon():
		icon.pivot_offset = icon.size/2
		var tween = create_tween()
		tween.tween_property(icon, "rotation_degrees", 15, 0.05)
		tween.tween_property(icon,  "rotation_degrees", -15, 0.05)
		tween.tween_property(icon,  "rotation_degrees", 0,0.05)

func _unhandled_input(event):
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_E:
			change_health(10)
			maize_left-=1
			if maize_left > 0:
				%Toast.show_message("Maize_eaten!" + str(maize_left) + "left")
		elif event.keycode == KEY_H:
			change_health(-10)
					
  
func _on_hunger_timer_timeout() -> void:
	change_health(-5)
	
func game_over():
	$"Hunger Timer".stop()
	%GameOver.visible = true
	%RestartButton.grab_focus()
	
func restart():
	get_tree().reload_current_scene()


func _on_restart_button_pressed() -> void:
	restart()
