import paquetes.*
import destinos.*

object mensajeria {

	var property mensajeros = []

	method contratar(alguien) {
		mensajeros.add(alguien)
	}

	method despedir(alguien) {
		mensajeros.remove(alguien)
	}

	method despedirATodos() {
		mensajeros.clear()
	}

	method esGrande() = mensajeros.size() > 2

	method puedeSerEntregadoPorElPrimero() = paquete.puedeSerEnviadoPor(mensajeros.first())

	method pesoDelUltimoMensajero() = mensajeros.first().peso()

}

object roberto {

	var property vehiculo = camion

	method peso() = 90 + vehiculo.peso()

	method puedeLlamar() = false

}

object neo {

	var property tieneCredito = true

	method peso() = 0

	method puedeLlamar() = tieneCredito

}

object chuckNorris {

	method peso() = 900

	method puedeLlamar() = true

}

// vehiculos
object camion {

	var property acoplados = 1

	method peso() = 500 * acoplados

}

object bicicleta {

	method peso() = 8

}

