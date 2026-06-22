@tool
extends EditorPlugin

func _enable_plugin() -> void:
	add_autoload_singleton("SkillTree", "res://addons/skill_tree_lite/skill_tree.gd")

func _disable_plugin() -> void:
	remove_autoload_singleton("SkillTree")
