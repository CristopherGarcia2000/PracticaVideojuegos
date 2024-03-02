extends Control
@export var mainMenu = preload("res://Scenes/main_menu.tscn") as PackedScene

@onready var video_stream_player = $VideoStreamPlayer

func _ready():
	video_stream_player.play()
	



func _on_video_stream_player_finished():
	get_tree().change_scene_to_packed(mainMenu)
