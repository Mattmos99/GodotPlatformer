extends CanvasLayer

var coins = 0

func _ready():
	$Coins.text = String(coins)


func _on_coin_collected():
	coins = coins + 1
	_ready()
	if coins == 3 :
		get_tree().change_scene("res://WinScreen.tscn")


func _on_Button_pressed():
	get_tree().quit()
