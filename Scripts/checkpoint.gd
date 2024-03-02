extends Node2D
class_name CheckPoint
@onready var animation = $"."
@onready var spawnPoint = false
var activated = false
func _ready():
	animation.play("Idle")
	if spawnPoint:
		activate()
func activate():
	$AudioStreamPlayer2D.play()
	GameManager.currentCheckpoint = self
	activated = true
	animation.play("Activated")
	

func _on_area_2d_area_entered(area):
	if area.get_parent() is Player && !activated:
		activate()
