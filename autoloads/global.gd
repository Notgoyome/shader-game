extends Node

signal on_level_changed(level: Level)

var _current_level: Level = null

func get_current_level() -> Level:
    return _current_level

func set_current_level(level: Level) -> void:
    _current_level = level
    emit_signal("on_level_changed", level)