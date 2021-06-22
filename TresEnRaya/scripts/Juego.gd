extends Control

onready var JugadorLabel = get_node("jugadorLabel")

onready var primeroA = get_node("1A")
onready var segundoA = get_node("2A")
onready var terceroA = get_node("3A")

onready var primeroB= get_node("1B")
onready var segundoB = get_node("2B")
onready var terceroB = get_node("3B")

onready var primeroC= get_node("1C")
onready var segundoC = get_node("2C")
onready var terceroC = get_node("3C")

# Called when the node enters the scene tree for the first time.
func _ready():
	actualizarBotones()
	JugadorLabel.set_text(GlobalServer.jugador) 
	if GlobalServer.jugador == "Server":
		desactivar_activar_botones(true)
	JugadorLabel.set_text(GlobalServer.jugador) 
	pass # Replace with function body.
	

func desactivar_activar_botones(siOno):
	primeroA.disabled = siOno
	segundoA.disabled = siOno
	terceroA.disabled = siOno
	primeroB.disabled = siOno
	segundoB.disabled = siOno
	terceroB.disabled = siOno
	primeroC.disabled = siOno
	segundoC.disabled = siOno
	terceroC.disabled = siOno


func actualizarBotones():
#	print("GlobalServer.dic_botones.dic_botones[primeroA]" , GlobalServer.dic_botones.dic_botones[primeroA])
	primeroA.set_text(GlobalServer.dic_botones["primeroA"])
	segundoA.set_text(GlobalServer.dic_botones["segundoA"])
	terceroA.set_text(GlobalServer.dic_botones["terceroA"])

	primeroB.set_text(GlobalServer.dic_botones["primeroB"])
	segundoB.set_text(GlobalServer.dic_botones["segundoB"])
	terceroB.set_text(GlobalServer.dic_botones["terceroB"])
#
	primeroC.set_text(GlobalServer.dic_botones["primeroC"])
	segundoC.set_text(GlobalServer.dic_botones["segundoC"])
	terceroC.set_text(GlobalServer.dic_botones["terceroC"])
	pass

func _on_1A_pressed():
	
	if GlobalServer.dic_botones["primeroA"] == "vacio":
		desactivar_activar_botones(true)
		if GlobalServer.jugador == "Server":
			GlobalServer.ServerCambiaDic("primeroA","Server")
		elif GlobalServer.jugador == "cliente":
			GlobalServer.ClientePulsacion("primeroA", "cliente")
	else:
		pass

func _on_2A_pressed():
	
	if GlobalServer.dic_botones["segundoA"] == "vacio":
		desactivar_activar_botones(true)
		if GlobalServer.jugador == "Server":
#			print("Server  " + " segundoA")
			GlobalServer.ServerCambiaDic("segundoA","Server")
		elif GlobalServer.jugador == "cliente":
			GlobalServer.ClientePulsacion("segundoA", "cliente")
	else:
		pass

func _on_3A_pressed():
	
	if GlobalServer.dic_botones["terceroA"] == "vacio":
		desactivar_activar_botones(true)
		if GlobalServer.jugador == "Server":
#			print("Server  " + " terceroA")
			GlobalServer.ServerCambiaDic("terceroA","Server")
		elif GlobalServer.jugador == "cliente":
			GlobalServer.ClientePulsacion("terceroA", "cliente")
	else:
		pass

func _on_1B_pressed():
	
	if GlobalServer.dic_botones["primeroB"] == "vacio":
		desactivar_activar_botones(true)
		if GlobalServer.jugador == "Server":
#			print("Server  " + " primeroB")
			GlobalServer.ServerCambiaDic("primeroB","Server")
		elif GlobalServer.jugador == "cliente":
			GlobalServer.ClientePulsacion("primeroB", "cliente")
	else:
		pass

func _on_2B_pressed():
	
	if GlobalServer.dic_botones["segundoB"] == "vacio":
		desactivar_activar_botones(true)
		if GlobalServer.jugador == "Server":
#			print("Server  " + " segundoB")
			GlobalServer.ServerCambiaDic("segundoB","Server")
		elif GlobalServer.jugador == "cliente":
			GlobalServer.ClientePulsacion("segundoB", "cliente")

func _on_3B_pressed():
	
	if GlobalServer.dic_botones["terceroB"] == "vacio":
		desactivar_activar_botones(true)
		if GlobalServer.jugador == "Server":
#			print("Server  " + " terceroB")
			GlobalServer.ServerCambiaDic("terceroB","Server")
		elif GlobalServer.jugador == "cliente":
			GlobalServer.ClientePulsacion("terceroB",GlobalServer.jugador)
	else:
		pass

func _on_1C_pressed():
	
	if GlobalServer.dic_botones["primeroC"] == "vacio":
		desactivar_activar_botones(true)
		if GlobalServer.jugador == "Server":
#			print("Server  " + " primeroC")
			GlobalServer.ServerCambiaDic("primeroC","Server")
		elif GlobalServer.jugador == "cliente":
			GlobalServer.ClientePulsacion("primeroC",GlobalServer.jugador)
	else:
		pass

func _on_2C_pressed():
	
	if GlobalServer.dic_botones["segundoC"] == "vacio":
		desactivar_activar_botones(true)
		if GlobalServer.jugador == "Server":
#			print("Server  " + " segundoC")
			GlobalServer.ServerCambiaDic("segundoC","Server")
		elif GlobalServer.jugador == "cliente":
			GlobalServer.ClientePulsacion("segundoC",GlobalServer.jugador)
	else:
		pass

func _on_3C_pressed():
	
	if GlobalServer.dic_botones["terceroC"] == "vacio":
		desactivar_activar_botones(true)
		if GlobalServer.jugador == "Server":
#			print("Server  " + " terceroC")
			GlobalServer.ServerCambiaDic("terceroC","Server")
		elif GlobalServer.jugador == "cliente":
			GlobalServer.ClientePulsacion("terceroC",GlobalServer.jugador)
	else:
		pass
