extends CenterContainer

var action = ""

func _ready():
	%PauseButton.pressed.connect(toggle_menu)
	%ResumeButton.pressed.connect(toggle_menu)
	%RestartButton2.pressed.connect(ask.bind("restart"))
	%QuitButton.pressed.connect(ask.bind("quit"))
	%ConfirmDialog.confirmed.connect(do_action)
	%ConfirmDialog.canceled.connect(%ResumeButton.grab_focus)
	
func _unhandled_input(event):
	if event is InputEventKey and event.pressed and event.keycode == KEY_P:
		toggle_menu()
			
func toggle_menu():
	if %GameOver.visible:
		return
	visible = not visible
	get_tree().paused = visible
	if visible:
		%ResumeButton.grab_focus()
				
				
func ask (what):
	action = what 
	%ConfirmDialog.dialog_text= "Are you sure you want to " + what + "?"
	%ConfirmDialog.popup_centered()
				
				
func do_action():
	get_tree().paused= false
	if action ==  "restart":
		get_tree().reload_current_scene()
	else:
		get_tree().quit()
			
		
