extends Panel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var ItemClass = preload("res://Item.tscn");

# Called when the node enters the scene tree for the first time.
func _ready():
	EventBus.subscribe("pickup_item", self, "_handle_event")
	pass # Replace with function body.

func _handle_event(data):
	print("DATA: ", data);
	add_child(ItemClass.instance())

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
