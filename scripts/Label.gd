extends Label

func _ready():
	get_node("/root/Inventory").connect("new_item", self.update_text)

func update_text(text):
	self.text = text

