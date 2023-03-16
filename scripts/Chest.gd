extends Node2D

@export var chest_content: String
@export var is_collected: bool = false;
var is_player_near = false;

func _ready():
	assert(chest_content)
	
	if is_collected:
		get_node("AnimatedSprite2D").play("open")
	else:
		get_node("AnimatedSprite2D").play("closed")

func _input(event):
	if event.is_action_pressed("player_interact") and is_player_near and not is_collected:
		is_collected = true
		collect_item()

func collect_item():
	get_node("Animation").play("open")
	get_node("/root/Inventory").add_item(chest_content)

func _on_player_entered(area):
	if area.is_in_group("Player"):
		is_player_near = true

func _on_player_exited(area):
	if area.is_in_group("Player"):
		is_player_near = false
