extends Control

onready var lista_botones = {
	"primeroA" : null,"segundoA" : null,"terceroA" : null,
	"primeroB" : null,"segundoB" : null,"terceroB" : null,
	"primeroC" : null,"segundoC" : null,"terceroC" : null
	}

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
#	print("mi peer",get_tree().get_network_unique_id())
#	lista_botones.append(primeroA)
#	lista_botones.append(segundoA)
#	lista_botones.append(terceroA)
#
#	lista_botones.append(primeroB)
#	lista_botones.append(segundoB)
#	lista_botones.append(terceroB)
#
#	lista_botones.append(primeroC)
#	lista_botones.append(segundoC)
#	lista_botones.append(terceroC)
	
	JugadorLabel.set_text(GlobalServer.jugador) 
	pass # Replace with function body.
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func desactivar_botones():
	primeroA.disabled = true
	segundoA.disabled = true
	terceroA.disabled = true
	primeroB.disabled = true
	segundoB.disabled = true
	terceroB.disabled = true
	primeroC.disabled = true
	segundoC.disabled = true
	terceroC.disabled = true

func _on_1A_pressed():
	
#	rpc_id(<peer_id>,"function_name", <optional_args>)
#		rpc_unreliable_id(<peer_id>, "function_name", <optional_args>)
	
 #  probando rpc VOY POR AQUI ########################
	desactivar_botones()
	GlobalServer.mandar_pulsacion_boton("primeroA")
	
	pass # Replace with function body.
