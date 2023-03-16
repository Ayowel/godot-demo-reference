extends Node

signal new_item(item_name)

func add_item(item_name):
	emit_signal("new_item", item_name)
