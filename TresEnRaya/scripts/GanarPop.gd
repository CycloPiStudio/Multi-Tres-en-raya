extends Popup



var imagenWin = preload("res://img/imgWin.png")
var imagenLose = preload("res://img/imgLose.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func IntanciarImagenResult(ganador):
	if ganador == GlobalServer.jugador:
		imagenWin.instance()
	else:
		imagenLose.instance()
		
