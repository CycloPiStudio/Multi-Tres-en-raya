extends Node

var jugador
# el servidor es el jugador 0 y el cliente es el 1
var peer = NetworkedMultiplayerENet.new()
#var SERVER_PORT = 6969
var MAX_PLAYERS = 2
#var SERVER_IP = "192.168.18.32"
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
#	scene = load("res://0_practice_folder/mc/instance_box.tscn")
#	scene = load("res://0_practice_folder/mc/instance_box.tscn")
	var node = scene.instance()
#	self.add_child(node)
	add_child(node)
#	get_node("EscenaPrincipal/Seleccionar").queue_free()
	get_tree().get_root().get_node("EscenaPrincipal/Seleccionar").queue_free()
#	print(self.get_children())
	
func end_juego():
	pass

func mandar_pulsacion_boton(boton):
	rpc_unreliable_id(1, "Pulsacion", boton)
	
remote func Pulsacion(boton):
	print("llegaste  " + boton)
	pass
