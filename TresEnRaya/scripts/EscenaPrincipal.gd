extends Control

onready var ClienteTextEditSERVER_IP = get_node("Cliente/TextEditSERVER_IP")
onready var ClienteTextEditSERVER_PORT = get_node("Cliente/TextEditSERVER_PORT")
onready var ServerTextEditSERVER_PORT = get_node("Server/TextEditSERVER_PORT")
# Called when the node enters the scene tree for the first time.
func _ready():
	ClienteTextEditSERVER_IP.set_text("127.0.0.1")
	ClienteTextEditSERVER_PORT.set_text("1909")
	ServerTextEditSERVER_PORT.set_text("1909")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Cliente_pressed():
	GlobalServer.jugador = "cliente"
	var SERVER_IP = ClienteTextEditSERVER_IP.get_text() 
	var SERVER_PORT = int(ClienteTextEditSERVER_PORT.get_text())
	
	GlobalServer.create_client(SERVER_IP, SERVER_PORT)
	pass # Replace with function body.
	


func _on_Server_pressed():
	GlobalServer.jugador = "Server"
	var SERVER_PORT = int(ClienteTextEditSERVER_PORT.get_text())
	GlobalServer.create_server(SERVER_PORT)
	pass # Replace with function body.
