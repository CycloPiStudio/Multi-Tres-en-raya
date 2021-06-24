extends Control


onready var ClienteBoton = get_node("Cliente")
onready var ServerBoton = get_node("Server")

onready var ClienteTextEditSERVER_IP = get_node("Cliente/TextEditSERVER_IP")
onready var ClienteTextEditSERVER_PORT = get_node("Cliente/TextEditSERVER_PORT")
onready var ServerTextEditSERVER_PORT = get_node("Server/TextEditSERVER_PORT")
onready var LabelResultados = get_node("LabelResult")
var mostraRresultado = " "
# Called when the node enters the scene tree for the first time.
func _ready():
	ClienteTextEditSERVER_IP.set_text("127.0.0.1")
	ClienteTextEditSERVER_PORT.set_text("1909")
	ServerTextEditSERVER_PORT.set_text("1909")


func _on_Cliente_pressed():
	desactivarBotones()
	GlobalServer.jugador = "cliente"
	var SERVER_IP = ClienteTextEditSERVER_IP.get_text() 
	var SERVER_PORT = int(ClienteTextEditSERVER_PORT.get_text())
	mostraRresultado = "Conectando con el servidor"
	GlobalServer.create_client(SERVER_IP, SERVER_PORT)
	PrintarResult(mostraRresultado)
	


func _on_Server_pressed():
	desactivarBotones()
	GlobalServer.jugador = "Server"
	
	var SERVER_PORT = int(ServerTextEditSERVER_PORT.get_text())
	GlobalServer.create_server(SERVER_PORT)
	mostraRresultado = "Esperando al cliente"
	PrintarResult(mostraRresultado)

func PrintarResult(resultado):
	LabelResultados.set_text(resultado)
	
func desactivarBotones():
	ClienteBoton.disabled = true
	ServerBoton.disabled = true
