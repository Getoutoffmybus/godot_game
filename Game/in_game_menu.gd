extends CanvasLayer

onready var select_arrow = $Control/NinePatchRect/TextureRect
onready var menu = $Control
const party_screen = preload("res://party_screen.tscn")

enum ScreenLoaded { NOTHING, JUST_MENU, PARTY_SCREEN, INVENTORY,}
var screen_loaded = ScreenLoaded.NOTHING 
onready var playerNode =  get_tree().get_root().get_node("Node2D/Gebouwen/Player")
var selected_option: int = 0


func _ready():
	menu.visible = false
	select_arrow.rect_position.y = 6 + (selected_option % 6) * 15
	
func _unhandled_input(event):
	match screen_loaded:
		ScreenLoaded.NOTHING:
			if event.is_action_pressed("menu"):
				if !playerNode.walking:
					menu.visible = true
					get_tree().paused = true
					screen_loaded = ScreenLoaded.JUST_MENU
			
		ScreenLoaded.JUST_MENU:
			if event.is_action_pressed("menu"):
				screen_loaded = ScreenLoaded.NOTHING
				get_tree().paused = false
				menu.visible = false
			elif event.is_action_pressed("down"):
				selected_option +=1
				select_arrow.rect_position.y = 6 + (selected_option % 6) * 32
			elif event.is_action_pressed("up"):
				if selected_option == 0:
					selected_option = 5
				else:
					selected_option -= 1
				select_arrow.rect_position.y = 6 + (selected_option % 6) * 32
			elif event.is_action_pressed("open") and selected_option == 0:
				screen_loaded = ScreenLoaded.PARTY_SCREEN
				$Control/AnimationPlayer.play("fade_in")
				$Control/NinePatchRect.visible = false
				
				if $Control/AnimationPlayer.current_animation =='fade_in':
					$Control/AnimationPlayer.play("fade_out")
					var party_scene = party_screen.instance()
					add_child(party_scene)
					party_scene.visible = true
					
		ScreenLoaded.PARTY_SCREEN:
			if event.is_action_pressed("menu"):
				$Control/AnimationPlayer.play("fade_in")
				
				print("kut misty sterf")
			
				if $Control/AnimationPlayer.current_animation =='fade_in':
					$Control/AnimationPlayer.play("fade_out")
				
