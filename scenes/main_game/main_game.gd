@tool
extends Control
class_name MainGame

@onready var source_viewport: SubViewport = %SourceViewport
@onready var target_viewport: SubViewport = %TargetViewport

@onready var code_editor: TextEdit = %CodeEditor
@onready var my_shader: TextureRect = %MyShader
@onready var target_shader: TextureRect = %TargetShader
@export var canvas_size: Vector2 = Vector2(32, 32) :
	set(value):
		canvas_size = value

		if (!source_viewport or !target_viewport or !my_shader or !target_shader):
			return
			
		source_viewport.size = value
		target_viewport.size = value



		my_shader.size = value
		target_shader.size = value


var change_level : bool = true
signal shader_changed

func _ready() -> void:
	Global.set_game(
		my_shader,
		target_shader,
		code_editor
	)
	set_new_shader()
	if change_level:
		Global.change_level(Global.get_level())

func _on_text_editor_text_changed() -> void:
	set_new_shader()
	pass # Replace with function body.


func set_new_shader():
	var new_shader: Shader = Shader.new()

	new_shader.code = code_editor.text
	
	# shader_material.shader = new_shader #here error
	my_shader.material.shader = new_shader

	#HACK: find a way to check if the shader is compiled
	await get_tree().process_frame
	await get_tree().process_frame
	await get_tree().process_frame
	await get_tree().process_frame
	await get_tree().process_frame

	emit_signal("shader_changed")
