extends Area2D

var picked = false;

func _on_Area2D_body_entered(body):
	if (picked): return
	picked = true;
	EventBus.publish("pickup_item", {"item": "apple"})
	get_node("Sprite").visible = false
