extends VBoxContainer

onready var playerNode =  get_node("/root/Node2D/Gebouwen/Player")

var menu = false
	
func _input(Input):
	if  playerNode.walking == false:
		if Input.is_action_pressed("menu"):
			if menu == false:
				menu = true
				visible = true
				get_tree().paused = true
				pass
			elif menu == true:
				menu = false
				visible = false
				get_tree().paused = false
				pass
