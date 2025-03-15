extends Control

@onready var master_volume_slider = $MarginContainer/VBoxContainer/Volume

func _ready():
	var audio_settings = ConfigFileHandler.load_audio_settings()
	if "Master" in audio_settings:
		master_volume_slider.value = min(audio_settings["Master"], 1.0) * 100


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://Scene/menu.tscn")


func _on_volume_drag_ended(value_changed):
	if value_changed:
		ConfigFileHandler.save_audio_setting("Master", master_volume_slider.value / 100)
