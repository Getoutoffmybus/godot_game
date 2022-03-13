extends Area2D 

var character_name : String = "Bugcatcher Gary"

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.

func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		Eventhandler.emit_signal("battle_started", character_name)

