extends ColorRect

@export var new_material: ShaderMaterial


func _ready() -> void:
    material = new_material
    print("ColorRect ready")
    pass
    