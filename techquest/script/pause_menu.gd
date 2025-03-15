extends Control

func resume():
	get_tree().paused =  false
	$AnimationPlayer.play_backwards("RESET")
	hide()
func paused():
	get_tree().paused = true
	$AnimationPlayer.play("blur")
	show()
func testEsc():
	if Input.is_action_just_pressed("esc") and !get_tree().paused:
		paused()
	elif Input.is_action_just_pressed("esc") and get_tree().paused:
		resume()

func _on_resume_pressed():
	resume()
  
func _on_restart_pressed():
	resume()
	get_tree().reload_current_scene()

func _on_return_to_menu_pressed():
	resume()
	get_tree().change_scene_to_file("res://Scene/menu.tscn")
	
func _on_quit_pressed():
	get_tree().quit()
	
func _process(_delta):
	testEsc()
