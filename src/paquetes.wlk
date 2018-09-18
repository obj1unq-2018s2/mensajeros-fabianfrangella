object paquete {

	var property estaPago
	var property destino

	method pagar() {
		estaPago = true
	}

	method puedeSerEnviadoPor(mensajero) = destino.puedePasar(mensajero) && estaPago

}

