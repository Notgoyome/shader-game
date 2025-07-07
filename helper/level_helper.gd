class_name LevelHelper

static func change_level(level: Level, code_editor, source_text, target_text, index = 0):
    if level.editor_text != "":
        code_editor.text = level.editor_text

    source_text.material = level.material.duplicate(true)
    var shader = Shader.new()
    shader.code = code_editor.text
    source_text.material.shader = shader
    target_text.material = level.material
    
    source_text.texture = level.base_texture
    target_text.texture = level.base_texture


    if Global:
        Global.set_level(index)
        Global.emit_signal("on_level_changed")
    # print("emitting")
