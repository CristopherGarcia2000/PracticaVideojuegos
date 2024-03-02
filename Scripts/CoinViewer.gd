extends Control

func _ready():
	GameManager.gained_coins.connect(update_coin_display)

func update_coin_display(gained_coins):
	$AudioStreamPlayer2D.play()
	$CoinDisplay.text = str(GameManager.coins)
	
