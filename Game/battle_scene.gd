extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$background.visible = false 
	Eventhandler.connect("battle_started", self, "init")
	pass
	
func init(_character_name):
	visible = true
	print(visible)
	$AnimationPlayer.play("fade_in")
	
	
	print($AnimationPlayer.current_animation)
	get_tree().paused = true
	pass
	


func _on_AnimationPlayer_animation_finished(anim_name):
	print("dit is"+anim_name)
	
	if anim_name=='fade_in':
		
		$AnimationPlayer.play("fade_out")
		$background.visible = true
		var scene = load("res://creature.tscn")
		var appleboi = scene.instance()
		add_child(appleboi)

		$background/Panel/Fight_button.grab_click_focus()
		


func _on_Run_button_pressed():
	get_tree().paused = false	
	visible = false
	$background.visible = false
	pass
