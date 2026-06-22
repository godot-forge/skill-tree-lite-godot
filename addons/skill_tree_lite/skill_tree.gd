extends Node

const MAX_SKILLS := 8

signal skill_unlocked(skill_id: String)
signal skill_locked(skill_id: String)

var _skills: Dictionary = {}

func define(skill_id: String, display_name: String, prerequisites: Array = [],
		description: String = "") -> void:
	if _skills.size() >= MAX_SKILLS and not _skills.has(skill_id):
		push_warning("SkillTree Lite: max %d skills reached." % MAX_SKILLS)
		return
	_skills[skill_id] = {
		"name": display_name, "description": description,
		"prerequisites": prerequisites, "unlocked": false,
	}

func can_unlock(skill_id: String) -> bool:
	if not _skills.has(skill_id):
		return false
	if _skills[skill_id]["unlocked"]:
		return false
	for prereq in _skills[skill_id]["prerequisites"]:
		if not is_unlocked(prereq):
			return false
	return true

func unlock(skill_id: String) -> bool:
	if not can_unlock(skill_id):
		return false
	_skills[skill_id]["unlocked"] = true
	emit_signal("skill_unlocked", skill_id)
	return true

func lock(skill_id: String) -> bool:
	if not _skills.has(skill_id) or not _skills[skill_id]["unlocked"]:
		return false
	_skills[skill_id]["unlocked"] = false
	emit_signal("skill_locked", skill_id)
	return true

func is_unlocked(skill_id: String) -> bool:
	return _skills.has(skill_id) and _skills[skill_id]["unlocked"]

func all_skills() -> Array:
	return _skills.keys()

func unlocked_skills() -> Array:
	var result: Array = []
	for id in _skills:
		if _skills[id]["unlocked"]:
			result.append(id)
	return result

func get_info(skill_id: String) -> Dictionary:
	return _skills.get(skill_id, {}).duplicate()

func reset_all() -> void:
	for id in _skills:
		_skills[id]["unlocked"] = false

func save_state() -> Dictionary:
	var data: Dictionary = {}
	for id in _skills:
		data[id] = _skills[id]["unlocked"]
	return data

func load_state(data: Dictionary) -> void:
	for id in data:
		if _skills.has(id):
			_skills[id]["unlocked"] = data[id]
