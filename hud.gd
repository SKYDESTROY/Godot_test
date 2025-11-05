extends CanvasLayer

signal  startgame

func showmessage(text):
	$message.text = "text"
	$message.show()
	$messagetimer.start()
	
func gameover():
	showmessage("gameover")	
	$message.text = "Dodge the Creeps!"
	$message.show()
	await get_tree().create_timer(1.0).timeout
	$start.show()
	
func updatescore(score):
	$score.text = str(score)

func _on_start_pressed() -> void:
	$start.hide()
	startgame.emit()

func _on_messagetimer_timeout() -> void:
	$message.hide()
