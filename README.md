# Skill Tree Lite — Godot 4

Free Godot 4 addon for skill trees — define skills with prerequisites, unlock/lock, save/load.

## Features (Lite — Free, max 8 skills)

- `define(id, name, prerequisites)` — register a skill
- `can_unlock(id)` — checks prerequisites
- `unlock(id)` / `lock(id)` / `is_unlocked(id)`
- `unlocked_skills()` / `all_skills()` / `reset_all()`
- `save_state()` / `load_state()`
- Signals: `skill_unlocked(id)` / `skill_locked(id)`

## Quick Start

```gdscript
# Autoload: SkillTree
SkillTree.define("slash", "Slash", [])
SkillTree.define("power_slash", "Power Slash", ["slash"])
SkillTree.unlock("slash")
SkillTree.unlock("power_slash")  # works now that slash is unlocked
```

## Upgrade to PRO

[Skill Tree PRO](https://godot-forge.itch.io/skill-tree-pro-godot) adds:
- Unlimited skills
- Point cost system (`set_skill_points`, `add_skill_points`)
- Multi-level skills (`max_level`)
- Refund mechanic (refund if no dependents)
- Branches + tiers for organization
- `available_skills()` / `total_points_spent()`
- `tree_reset` signal

---
Made with ♥ by [GodotForge](https://itch.io/profile/godot-forge)
