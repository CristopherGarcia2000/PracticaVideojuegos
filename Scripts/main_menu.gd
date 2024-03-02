class_name MainMenu
extends Control
@onready var startButton = $MarginContainer/HBoxContainer/VBoxContainer/Button as Button
@onready var exitButton = $MarginContainer/HBoxContainer/VBoxContainer/Button2 as Button
@export var startLevel = preload("res://Scenes/Main.tscn") as PackedScene

func _ready():
	$AudioStreamPlayer2D.play()
	startButton.button_down.connect(on_button_down)
	exitButton.button_down.connect(on_exit_pressed)
	
func on_button_down() -> void:
	get_tree().change_scene_to_packed(startLevel)

func on_exit_pressed() -> void:
	get_tree().quit()
