extends Node

func _value_changed(new_value):
	if new_value == 0:
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), -80.0)
		print("Głośność ustawiona na -80 dB (wyciszenie).")
	else:
		var db_value = ((new_value / 100.0) * 92.0) - 80.0
		print("Ustawiona głośność na: ", db_value, " dB")
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), db_value)



var config = ConfigFile.new()
const SETTING_FILE_PATH = "res://setting.ini"

func _ready():
	if !FileAccess.file_exists(SETTING_FILE_PATH):
		config.set_value("audio", "Master", 1.0)
		config.save(SETTING_FILE_PATH)
	else:
		config.load(SETTING_FILE_PATH)

func save_audio_setting(key: String, value): 
	config.set_value("audio", key, value) 
	config.save(SETTING_FILE_PATH) 
	
func load_audio_settings(): 
	var audio_settings = {} 
	for key in config.get_section_keys("audio"): 
		audio_settings [key] = config.get_value("audio", key) 
	return audio_settings
