#func ComprobarResultado(idjugador):
################################# horizontales
#	var ganador = "sigueJugando"
#	if dic_botones["primeroA"] and  dic_botones["segundoA"] and dic_botones["terceroA"] == idjugador:
#		print("HAS GANADO!!!!!!!!!!!!!!! :   " , idjugador)
#		ganador = idjugador
#	if dic_botones["primeroB"] and  dic_botones["segundoB"] and dic_botones["terceroB"] == idjugador:
#		print("HAS GANADO!!!!!!!!!!!!!!! :   " , idjugador)
#		ganador = idjugador
#	if dic_botones["primeroC"] and  dic_botones["segundoC"] and dic_botones["terceroC"] == idjugador:
#		print("HAS GANADO!!!!!!!!!!!!!!! :   " , idjugador)
#		ganador = idjugador
################################# verticales
#	if dic_botones["primeroA"] and  dic_botones["primeroB"] and dic_botones["primeroC"] == idjugador:
#		print("HAS GANADO!!!!!!!!!!!!!!! :   " , idjugador)
#		ganador = idjugador
#	if dic_botones["segundoA"] and  dic_botones["segundoB"] and dic_botones["segundoC"] == idjugador:
#		print("HAS GANADO!!!!!!!!!!!!!!! :   " , idjugador)
#		ganador = idjugador
#	if dic_botones["terceroA"] and  dic_botones["terceroB"] and dic_botones["terceroC"] == idjugador:
#		print("HAS GANADO!!!!!!!!!!!!!!! :   " , idjugador)
################################# diagonales
#	if dic_botones["primeroA"] and  dic_botones["segundoB"] and dic_botones["terceroC"] == idjugador:
#		print("HAS GANADO!!!!!!!!!!!!!!! diagonales :   " , idjugador)
##		ganador = idjugador
#	if dic_botones["terceroA"] and  dic_botones["segundoB"] and dic_botones["primeroC"] == idjugador:
#		print("HAS GANADO!!!!!!!!!!!!!!! diagonales :   " , idjugador)
#		ganador = idjugador
#	else:
#		print("sigue intentandolo :  ", idjugador)
#		ganador = "sigueJugando"
#	return ganador






##### el cliente le manda al servidor la pulsacion #### solo lado cliente
#func ClientePulsacion(boton, idjugador):
#
#	rpc_unreliable_id(1, "ClienteCambiaDic", boton, idjugador)
	
#### el servidor recibe la pulsacion #### esta funcion solo la activa  el cliente

#remote func ClienteCambiaDic(boton, idjugador):
##	print("llego el cliente al servidor  " + boton + idjugador)
#	dic_botones[boton] = idjugador
#
#	get_node("/root/EscenaPrincipal/Juego").actualizarBotones()
#
#
#	var nodojuego = get_node("/root/EscenaPrincipal/Juego")
#	nodojuego.desactivar_activar_botones(false)
#
#
#func ServerCambiaDic(boton, idjugador):
#	##### cambio vacio por el nombre del jugador
#	dic_botones[boton] = idjugador
#	ComprobarResultado(idjugador)
#	ServerEnviarDic(idjugador)
#	get_node("/root/EscenaPrincipal/Juego").actualizarBotones()

