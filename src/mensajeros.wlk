import paquetes.*
import destinos.*

object mensajeria {

	var property mensajeros = []
	var property paquetesEnviados = []
	var property paquetesRecibidos = []
	var property paquetesActuales = []

	method recibirPaquete(unPaquete) {
		paquetesRecibidos.add(unPaquete)
		paquetesActuales.add(unPaquete)
	}

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

	method puedeSerEntregadoPorElPrimero(paquete) = paquete.puedeSerEnviadoPor(mensajeros.first())

	method pesoDelUltimoMensajero() = mensajeros.first().peso()

	method puedeSerEntregadoPorAlguno(paquete) = mensajeros.any{ mensajero => paquete.puedeSerEnviadoPor(mensajero) }

	method esFacilDeEntregar(paquete) = mensajeros.all{ mensajero => paquete.puedeSerEnviadoPor(mensajero) }

	method sobrePeso() = mensajeros.sum{ mensajero => mensajero.peso() } / mensajeros.size() > 500

	method enviarPaquete(paquete) {
		if (self.sePuedeEnviar(paquete)) {
			paquetesEnviados.add(paquete)
			paquetesActuales.remove(paquete)
		} else {
			self.error("No hay ningún mensajero que pueda entregar el paquete")
		}
	}

	method sePuedeEnviar(paquete) {
		return self.puedeSerEntregadoPorAlguno(paquete)
	}

	method enviarTodos() {
		paquetesActuales.forEach{ paquete =>
			if (self.sePuedeEnviar(paquete)) self.enviarPaquete(paquete)
		}
	}

	method paqueteMasCaro() = paquetesActuales.max{ paquete => paquete.precio() }

	method eficacia() {
		return (paquetesEnviados.size() / paquetesRecibidos.size() * 100).roundUp()
	}

}

object roberto {

	var property vehiculo = camion
	var peso

	method peso(cuanto) {
		peso = cuanto
	}

	method peso() = peso + vehiculo.peso()

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

