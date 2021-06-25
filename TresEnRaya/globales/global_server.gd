extends Node
### jugador "SErver o cliente ####
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

onready var escenaSeleccionar = preload("res://Seleccionar.tscn")
onready var sceneJuego = preload("res://Juego.tscn")
onready var scenaprincipal = get_tree().get_root().get_node("EscenaPrincipal")
onready var Ganarpop = get_tree().get_root().get_node("EscenaPrincipal/GanarPop")


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
	peer.connect("server_disconnected" , self, "_OnServerDisconnected")


func _OnConnectionFailed():
	var resu = (" fallo de red ... intentelo de nuevo")
	get_tree().get_root().get_node("EscenaPrincipal/Seleccionar").PrintarResult(resu)
	scenaprincipal.get_node("Seleccionar").desactivarBotones(false)
	
func _OnConnectionSucceeded():
	print("Conectado al servidor")
	start_juego()

func _OnServerDisconnected():
	print("Servidor desconectado")
	volver_inicio("Servidor desconectado")
	
func _Peer_Connected(player_id):
	print("User " + str(player_id) + " Connected")
	start_juego()
	

func _Peer_Disconnected(player_id):
	print("User " + str(player_id) + " Disconnected")
	volver_inicio("Cliente desconectado")

func start_juego():

	var node = sceneJuego.instance()	
	scenaprincipal.add_child(node)
	
	get_tree().get_root().get_node("EscenaPrincipal/Seleccionar").queue_free()

func volver_inicio(resultado):
	var node = escenaSeleccionar.instance()
	scenaprincipal.add_child(node)
	get_tree().get_root().get_node("EscenaPrincipal/Seleccionar").PrintarResult(resultado)
	get_tree().get_root().get_node("EscenaPrincipal/Juego").queue_free()

func reiniciar():
	dic_botones = {
	"primeroA" : "vacio","segundoA" : "vacio","terceroA" : "vacio",
	"primeroB" : "vacio","segundoB" : "vacio","terceroB" : "vacio",
	"primeroC" : "vacio","segundoC" : "vacio","terceroC" : "vacio"
	}
	scenaprincipal.get_node("Juego").actualizarBotones()
	Ganarpop.visible = false
	if jugador == "Server":
		scenaprincipal.get_node("Juego").desactivar_activar_botones(true)
	if jugador == "cliente":
		scenaprincipal.get_node("Juego").desactivar_activar_botones(false)
#	scenaprincipal.get_node("Juego").desactivar_activar_botones(false)
#	pass

#### el cliente manda la pulsacion al servidor #####
func ClientePulsacion(boton, idjugador):
	
	rpc_unreliable_id(1, "ClienteCambiaDic", boton, idjugador)

####el servidor recive la pulsacion 
remote func ClienteCambiaDic(boton, idjugador):
	ServerCambiaDic(boton, idjugador)


###### el servidor cambia el diccoinario
func ServerCambiaDic(boton, idjugador):
	##### cambio vacio por el nombre del jugador
	# le doy al diccionario el valor del boton pulsado	
	dic_botones [boton] = idjugador
	var ganador = ComprobarResultado(idjugador) 
	print("ComprobarResultado(idjugador)"   , ComprobarResultado(idjugador))
	print(" ganador   " , ganador)
	
	#### comprueba si hay un ganador ####
	if ganador == idjugador:
		GanarPerder(ganador)
#		pass

#### idjugador es  el jugador que envia la pcr 
#### ComprobarResultado(idjugador) ### te devuelve el resultado el ganador
	ServerEnviarDic(idjugador, ganador)
	get_node("/root/EscenaPrincipal/Juego").actualizarBotones()

#### envia el diccionario al clienete

func ServerEnviarDic(idjugador, ganador):
	#### almaceno el dicionario en dic
	var dic = dic_botones
	var nodojuego = get_node("/root/EscenaPrincipal/Juego")
#	if ganador == idjugador:
#		pass
	rpc_unreliable_id(0, "clienteReciveDic", dic, idjugador, ganador)

	### simulo el turno bloqueando los botones
	if idjugador == "cliente":
		nodojuego.desactivar_activar_botones(false)
	
	################ cambiar en el cliente el diccionario 
	
remote func clienteReciveDic(dic, idjugador, ganador):
	#### escena para comunicarse con "Escena Juego"
	var nodojuego = get_node("/root/EscenaPrincipal/Juego")
	#### coge el dic
	dic_botones = dic
	nodojuego.actualizarBotones()
	#### activa los botones para simular los turnos #####
#	 and not ganador == idjugador
	if idjugador == "Server":
		nodojuego.desactivar_activar_botones(false)
	
	if ganador == idjugador:
		GanarPerder(ganador)
	
	
func GanarPerder(ganador):
	scenaprincipal.IntanciarImagenResult(ganador)
	Ganarpop.visible = true
	scenaprincipal.get_node("Timer").start()
	print("Gano :  ", ganador)

#### introducir casos
func ComprobarResultado(idjugador):
#	var ganador = "Sigue jugando"
	var dicValues = dic_botones.values()
	var pA = dicValues[0]
	var sA = dicValues[1]
	var tA = dicValues[2]
	var pB = dicValues[3]
	var sB = dicValues[4]
	var tB = dicValues[5]
	var pC = dicValues[6]
	var sC = dicValues[7]
	var tC = dicValues[8]
	
	match dicValues:
################################# horizontales
		[idjugador, idjugador, idjugador, pB, sB, tB, pC, sC, tC]:
#			print("HAS GANADO!!!!!!!!!!!!!!!, idjugador, con pA, sA, tA: ", idjugador)
			return idjugador
		[pA, sA, tA, idjugador, idjugador, idjugador, pC, sC, tC]:
#			print("HAS GANADO!!!!!!!!!!!!!!!, idjugador: ", idjugador)
			return idjugador
		[pA, sA, tA, pB, sB, tB, idjugador, idjugador, idjugador]:
#			print("HAS GANADO!!!!!!!!!!!!!!!, idjugador: ", idjugador)
			return idjugador
################################# verticales
		[idjugador, sA, tA, idjugador, sB, tB, idjugador, sC, tC]:
#			print("HAS GANADO!!!!!!!!!!!!!!!, idjugador: ", idjugador)
			return idjugador
		[pA, idjugador, tA, pB, idjugador, tB, pC, idjugador, tC]:
#			print("HAS GANADO!!!!!!!!!!!!!!!, idjugador: ", idjugador)
			return idjugador
		[pA, sA, idjugador, pB, sB, idjugador, pC, sC, idjugador]:
#			print("HAS GANADO!!!!!!!!!!!!!!!, idjugador: ", idjugador)
			return idjugador
################################# diagonales
		[idjugador, sA, tA, pB, idjugador, tB, pC, sC, idjugador]:
#			print("HAS GANADO!!!!!!!!!!!!!!!, idjugador: ", idjugador)
			return idjugador
		[pA, sA, idjugador, pB, idjugador, tB, idjugador, sC, tC]:
#			print("HAS GANADO!!!!!!!!!!!!!!!, idjugador: ", idjugador)
			return idjugador
################################# seguir jugando
		_:
			return "SeguirJugando"

			




