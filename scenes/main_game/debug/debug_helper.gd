@tool
extends Node
class_name DebugHelper

@export var main_game : MainGame
@export var level_array: LevelArray = LevelArray.new()

@export var force_level: bool = false
@export_range(-1, 20) var debug_index: int = -1:
	set(value):
		debug_index = value
		var list_levels = level_array.list_levels
		if debug_index == -1:
			return
		if code_editor and source_text and target_text and list_levels.size() > debug_index:
			var level = list_levels[debug_index]
			LevelHelper.change_level(
				level,
				code_editor,
				source_text,
				target_text,
				debug_index
			)
			# if list_levels[debug_index].editor_text != "":
			#     code_editor.text = level.editor_text

			# source_text.material = level.material.duplicate(true)
			# source_text.material.shader = Shader.new()
			# target_text.material = level.material
			
			# source_text.texture = level.base_texture
			# target_text.texture = level.base_texture

@export_group("constant")
@export var code_editor: CodeEdit
@export var source_text: TextureRect
@export var target_text: TextureRect

func _ready() -> void:
	if debug_index == -1 or not force_level:
		return

	var list_levels = level_array.list_levels
	LevelHelper.change_level(
		list_levels[debug_index],
		code_editor,
		source_text,
		target_text,
		debug_index
	)
	if force_level:
		Global.set_level(debug_index)
	main_game.change_level = !force_level
	# Global.set_level(debug_index)
	# print("test")
	pass
