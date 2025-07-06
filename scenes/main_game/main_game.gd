@tool
extends Control
class_name MainGame

@onready var source_viewport: SubViewport = %SourceViewport
@onready var target_viewport: SubViewport = %TargetViewport

@onready var text_editor: TextEdit = %TextEditor
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
signal shader_changed

func _ready() -> void:
	set_new_shader()
	pass

func _on_text_editor_text_changed() -> void:
	set_new_shader()
	pass # Replace with function body.


func set_new_shader():
	var new_shader: Shader = Shader.new()

	new_shader.code = text_editor.text
	var shader_material : Material = ShaderMaterial.new()
	shader_material.shader = new_shader
	my_shader.material = shader_material
	await get_tree().process_frame
	await get_tree().process_frame

	emit_signal("shader_changed")
