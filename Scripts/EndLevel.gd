extends Node2D

@export var endVideo = preload("res://Scenes/end_video.tscn") as PackedScene





func _on_area_2d_area_entered(area):
	if area.get_parent() is Player:
		get_tree().change_scene_to_packed(endVideo)
		GameManager.coins = 0
		
