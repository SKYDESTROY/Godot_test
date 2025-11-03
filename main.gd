extends Node

@export var health :=100
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("hello,world")
	$Label.text="hello"
	$Label.modulate=Color.GREEN
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("myaction"):
		$Label.modulate=Color.RED
	if event.is_action_released("myaction"):
		$Label.modulate=Color.GREEN
