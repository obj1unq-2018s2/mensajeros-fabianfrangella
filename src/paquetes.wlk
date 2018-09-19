import destinos.*

object paquete {

	var property precio
	var property estaPago = false
	var property destino

	method pagar() {
		estaPago = true
	}

	method puedeSerEnviadoPor(mensajero) = destino.puedePasar(mensajero) && estaPago

}

object paquetito {

	const property precio = 0
	const property estaPago = true
	var property destino

	method puedeSerEnviadoPor(mensajero) = destino.puedePasar(mensajero)

}

object paqueton {

	const property precio = 100
	var totalPagado = 0
	var destinos = [ matrix, puenteDeBrooklyn ]
	var property estaPago = totalPagado.equals(destinos.size() * precio)

	method pagar(cantidad) {
		totalPagado += cantidad
	}

	method pagar() {
		totalPagado = destinos.size() * precio
	}

	method asignarDestinos(unaListaDeDestinos) {
		destinos = unaListaDeDestinos
	}

	method puedeSerEnviadoPor(mensajero) {
		return destinos.all{ destino => destino.puedePasar(mensajero) }
	}

}

