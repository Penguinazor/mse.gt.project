extends SpotLight

var is_activated = false

func _process(delta):
	if is_network_master():
		if Input.is_action_just_pressed("flashlight"):
			rpc('_switch_light')
			
sync func _switch_light():
	if !is_activated:
		show()
	else:
		hide()
	is_activated = !is_activated