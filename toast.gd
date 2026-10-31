extends PanelContainer
var tween
func show_message(text):
	$ToastLabel.text = text
	reset_size()
	visible = true
	modulate.a = 1.0
	if tween :
		tween.kill ()
	tween = create_tween()
	tween.tween_interval(2.0)
	tween.tween_property(self, "modulate:a", 0.0, 0.5)
	tween.tween_callback(hide)
