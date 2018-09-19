import destinos.*

object paquete {

	var property estaPago
	var property destino

	method pagar() {
		estaPago = true
	}

	method puedeSerEnviadoPor(mensajero) = destino.puedePasar(mensajero) && estaPago

}

object paquetito {

	const property estaPago = true
	var property destino

	method puedeSerEnviadoPor(mensajero) = destino.puedePasar(mensajero)

}

object paqueton {

	const precio = 100
	var totalPagado = 0
	var property destinos = []
	var property estaPago = totalPagado.equals(destinos.size() * precio)

	method pagar(cantidad) {
		totalPagado += cantidad
	}

	method pagar() {
		totalPagado = destinos.size() * precio
	}

	method puedeSerEnviadoPor(mensajero) {
		destinos.all{ destino => destino.puedePasar(mensajero)}
	}

}

