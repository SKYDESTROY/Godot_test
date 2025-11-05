extends Node

@export var enemyscene : PackedScene
var score

func _ready():
	pass
#接收hit信号
func gameover():
	$enemyspawntimer.stop()
	$scoretimer.stop()
	$HUD.gameover()
	
func newgame():	
	get_tree().call_group("enemy", "queue_free")
	score = 0
	$player.start($playposition.position)
	$starttimer.start()
	$HUD.updatescore(score)
	$HUD.showmessage("ready")
	

func _on_enemyspowntimer_timeout() :
	var enemy : = enemyscene.instantiate()
	var enemyspawnlocation = $enemypath/enemyspawnlocation
	#路径上随机生成
	enemyspawnlocation.progress_ratio = randf()
	enemy.position = enemyspawnlocation.position
	#方向垂直于生成路径
	var direction = enemyspawnlocation.rotation + PI /2
	direction += randf_range(-PI/4,PI/4)
	enemy.rotation = direction
	#随机速度
	var velocity = Vector2(randf_range(150.0,250.0),0.0)
	enemy.linear_velocity = velocity.rotated(direction)
	add_child(enemy)
	
func _on_scoretimer_timeout() -> void:
	score += 1
	$HUD.updatescore(score)
func _on_starttimer_timeout() -> void:
	$enemyspawntimer.start()
	$scoretimer.start()
