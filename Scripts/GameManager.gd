extends Node
@export var mainScreen = preload("res://Scenes/main_menu.tscn") as PackedScene

signal gained_coins(int)
var coins : int
var currentCheckpoint:CheckPoint
var player:Player

func respawn_player():
	if currentCheckpoint != null:
		player.global_position = currentCheckpoint.global_position
	else:
		player.global_position.x = -512 
		player.global_position.y = -14
func gain_coins(coins_gained:int):
	coins += coins_gained
	emit_signal("gained_coins",coins_gained)

