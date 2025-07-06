@tool
extends Button
class_name NextButton
@export var comparer_component: Node

@export var list_levels: Array[Level]

@export var source_text: TextureRect
@export var target_text: TextureRect
@export var code_editor: CodeEdit

@export_range(0, 20) var debug_index: int = -1 :
	set(value):
		debug_index = value
		if debug_index >= 0 && target_text and source_text:
			change_level(debug_index)
var index = 0

func _ready() -> void:
	if debug_index >= 0:
		change_level(debug_index)
	
		

func _on_pressed() -> void:
	comparer_component.compare_reset()
	index = min(index + 1, list_levels.size() - 1)
	change_level(index)

	await get_tree().process_frame
	await get_tree().process_frame
	comparer_component.compare()

func change_level(new_index: int) -> void:
	var level = list_levels[new_index]
	if list_levels[new_index].editor_text != "":
		code_editor.text = level.editor_text

	target_text.material = level.material
	
	source_text.texture = level.base_texture
	target_text.texture = level.base_texture

func _on_comparer_component_on_percentage_all() -> void:
	disabled = false


func _on_comparer_component_compare_done(percentage: float) -> void:
	if (round(percentage) != 100.0):
		disabled = true
	pass # Replace with function body.
