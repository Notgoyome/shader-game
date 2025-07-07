extends Node
class_name KeyTyperComponent

@onready var key_in: AudioStreamPlayer = %KeyIn
@onready var key_out: AudioStreamPlayer = $KeyOut

var base_pitch = 0.77

func _input(event: InputEvent) -> void:
	# check if keyboard key is pressed
	if event is InputEventKey and event.pressed:
		key_in.pitch_scale = base_pitch + (randf() * 0.2 - 0.1)  # Random pitch variation
		key_in.volume_db = randf_range(-2.0, 2.0)
		key_in.play()
	if event is InputEventKey and not event.pressed:
		key_out.pitch_scale = base_pitch + (randf() * 0.2 - 0.1)  # Random pitch variation
		key_out.volume_db = randf_range(-2.0, 2.0)
		key_out.play()
