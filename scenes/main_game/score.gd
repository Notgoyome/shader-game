extends Label


func _on_comparer_component_compare_done(percentage: float) -> void:
    text = "Score: " + str(max(round(percentage),0)) + "%"
    pass # Replace with function body.
