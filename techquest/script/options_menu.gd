extends Control


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://menu.tscn")


func _on_volume_value_changed(value: float) -> void:
	pass # Replace with function body.
