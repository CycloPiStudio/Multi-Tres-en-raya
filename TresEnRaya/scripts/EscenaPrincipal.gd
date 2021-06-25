extends Node2D


# Declare member variables here. Examples:
# var a = 2
var imagenWin = preload("res://img/imgWin.png")
var imagenLose = preload("res://img/imgLose.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func IntanciarImagenResult(ganador):
	if ganador == GlobalServer.jugador:
		$GanarPop/Sprite.set_texture(imagenWin)
	else:
		$GanarPop/Sprite.set_texture(imagenLose)

func _on_Timer_timeout():
	GlobalServer.reiniciar()
