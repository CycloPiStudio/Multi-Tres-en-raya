extends Node

var jugador
# el servidor es el jugador 0 y el cliente es el 1
var peer = NetworkedMultiplayerENet.new()
#var SERVER_PORT = 6969
var MAX_PLAYERS = 2
#var SERVER_IP = "192.168.18.32"


onready var dic_botones = {
	"primeroA" : "vacio","segundoA" : "vacio","terceroA" : "vacio",
	"primeroB" : "vacio","segundoB" : "vacio","terceroB" : "vacio",
	"primeroC" : "vacio","segundoC" : "vacio","terceroC" : "vacio"
	}

onready var scene = preload("res://Juego.tscn")



func _ready():
	
	pass

func create_server(SERVER_PORT):
	
	
	
	peer.create_server(SERVER_PORT, MAX_PLAYERS)
	get_tree().network_peer = peer
	print("servidor iniciado")
	
	peer.connect("peer_connected", self, "_Peer_Connected")
	peer.connect("peer_disconnected", self, "_Peer_Disconnected")
	
func create_client(SERVER_IP, SERVER_PORT):
	
	peer.create_client(SERVER_IP, SERVER_PORT)
	get_tree().network_peer = peer
	peer.connect("connection_failed", self, "_OnConnectionFailed")
	peer.connect("connection_succeeded", self, "_OnConnectionSucceeded")


func _OnConnectionFailed():
	print(" fallo de red")
	end_juego()
func _OnConnectionSucceeded():
	print("Conectado al servidor")
	
	
	
	start_juego()
func _Peer_Connected(player_id):
	print("User " + str(player_id) + " Connected")
	start_juego()
	

func _Peer_Disconnected(player_id):
	print("User " + str(player_id) + " Disconnected")
	end_juego()

func start_juego():
	var nodo_principal = get_node("/root/EscenaPrincipal")
	var node = scene.instance()
	
	nodo_principal.add_child(node)
	get_tree().get_root().get_node("EscenaPrincipal/Seleccionar").queue_free()

	
func end_juego():
	pass
#### el cliente le manda al servidor la pulsacion #### solo lado cliente
func ClientePulsacion(boton, idjugador):
	
	rpc_unreliable_id(1, "ClienteCambiaDic", boton, idjugador)
	
	

#### el servidor recibe la pulsacion #### esta funcion solo la activa  el cliente

remote func ClienteCambiaDic(boton, idjugador):
	print("llego el cliente al servidor  " + boton + idjugador)
	
	dic_botones[boton] = idjugador
	get_node("/root/EscenaPrincipal/Juego").actualizarBotones()
	ServerEnviarDic(idjugador)
	var nodojuego = get_node("/root/EscenaPrincipal/Juego")
	nodojuego.desactivar_activar_botones(false)


func ServerCambiaDic(boton, idjugador):
	##### cambio vacio por el nombre del jugador
	dic_botones[boton] = idjugador
	ServerEnviarDic(idjugador)
	get_node("/root/EscenaPrincipal/Juego").actualizarBotones()

#### envia el diccionario al clienete

func ServerEnviarDic(idjugador):
	var dic = dic_botones

	rpc_unreliable_id(0, "clienteReciveDic", dic, idjugador)
	
	print("envia el diccionario : " , dic)

	################ cambiar en el cliente el diccionario 
	
remote func clienteReciveDic(dic,idjugador):
	var nodojuego = get_node("/root/EscenaPrincipal/Juego")
	dic_botones = dic
	nodojuego.actualizarBotones()
	if idjugador == "Server":
		nodojuego.desactivar_activar_botones(false)
	print("ha recivido de vuelta el diccionario")

