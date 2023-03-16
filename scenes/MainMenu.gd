extends Node2D

@export var start_scene: PackedScene

func _ready():
	assert(start_scene)

func _on_start_pressed():
	get_tree().change_scene_to_packed(start_scene)

func _on_exit_pressed():
	get_tree().quit()
