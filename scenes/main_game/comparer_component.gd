extends Node
class_name ComparerComponent

@export var source_rect: Viewport
@export var target_rect: Viewport

signal compare_done
signal on_percentage_all

func distance_to(color1: Color, color2: Color) -> float:
	return (color1.r - color2.r) * (color1.r - color2.r) + \
		   (color1.g - color2.g) * (color1.g - color2.g) + \
		   (color1.b - color2.b) * (color1.b - color2.b)

func compare():
	var img = source_rect.get_texture().get_image()
	var img2 = target_rect.get_texture().get_image()
	var number_false = 0.0

	for y in range(img.get_height()):
		for x in range(img.get_width()):
			var color = img.get_pixel(x, y)
			var color2 = img2.get_pixel(x, y)
			if color != color2:
				number_false += (distance_to(color, color2))
	
	var percentage = 100 - float(number_false) / (img.get_width() * img.get_height()) * 100.0
	emit_signal("compare_done", percentage)
	if (round(percentage) == 100.0):
		emit_signal("on_percentage_all")

# func _input(event: InputEvent) -> void:
#     if Input.is_action_just_pressed("run"):
#         compare()

func compare_reset() -> void:
	emit_signal("compare_done", 0.0)
	pass

func _on_control_shader_changed() -> void:
	compare()
