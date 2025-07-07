extends Button
@export var comparer_component: Node


func _on_pressed() -> void:
	Global.next_level()
	comparer_component.compare_reset()
	pass # Replace with function body.
