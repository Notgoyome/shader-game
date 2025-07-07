@tool
extends Button
class_name NextButton
@export var comparer_component: Node

@export var list_levels: Array[Level]

@export var source_text: TextureRect
@export var target_text: TextureRect
@export var code_editor: CodeEdit

var index = 0

func _ready() -> void:
	pass
	
		

func _on_pressed() -> void:
	comparer_component.compare_reset()
	index = min(index + 1, list_levels.size() - 1)
	Global.next_level()

	await get_tree().process_frame
	await get_tree().process_frame
	comparer_component.compare()

func _on_comparer_component_on_percentage_all() -> void:
	disabled = false


func _on_comparer_component_compare_done(percentage: float) -> void:
	if (round(percentage) != 100.0):
		disabled = true
	pass # Replace with function body.
