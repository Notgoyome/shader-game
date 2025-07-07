extends Node

signal on_level_changed(level: Level)
@export var level_array: LevelArray = LevelArray.new()
var list_levels
var source_text: TextureRect
var target_text: TextureRect
var code_editor: CodeEdit

var _current_index: int = -1
var save_resource = SaveResource.new()

func set_game(source_text, target_text: TextureRect, code_editor: CodeEdit) -> void:
	print("setting game")
	self.source_text = source_text
	self.target_text = target_text
	self.code_editor = code_editor

func incr_level_index() -> void:
	var new_index = min(get_level() + 1, list_levels.size() - 1)
	set_level(new_index)

func get_level() -> int:
	return _current_index

func set_level(new_index: int) -> void:
	print("setting level")
	if new_index < 0 or new_index >= list_levels.size():
		print("Invalid level index:", new_index)
		return
	_current_index = new_index

func save_state() -> void:
	print("Saving state for level index:")
	print(_current_index)
	save_resource.current_level_index = _current_index

	ResourceSaver.save(save_resource, "user://save.tres")

func _ready() -> void:
	list_levels = level_array.list_levels
	if _current_index == -1:
		on_level_changed.connect(save_state)
		var loaded_level : SaveResource = ResourceLoader.load("user://save.tres")
		if loaded_level:
			set_level(loaded_level.current_level_index)
			print("Loaded level index:", _current_index)
		else:
			set_level(0)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("unskip"):
		previous_level()
		return
	if event.is_action_pressed("skip"):
		next_level()

func next_level() -> void:
	incr_level_index()
	change_level(_current_index)

func previous_level() -> void:
	var new_index = max(get_level() - 1, 0)
	print("getting level: ", get_level())
	set_level(new_index)
	change_level(new_index)

func change_level(new_index: int) -> void:
	var level = list_levels[new_index]
	LevelHelper.change_level(level, code_editor, source_text, target_text, new_index)
