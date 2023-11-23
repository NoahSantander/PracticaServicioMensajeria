import Contenidos.*

class Mensaje {
	const usuario
	const contenidos = []
	
	method usuario() = usuario
	method pesoContenido() = contenidos.sum({ contenido => contenido.peso()})
	method peso() = 5 + self.pesoContenido() * 1.3
	
	method esParteDeQuienLoEnvia(texto) = usuario.contains(texto)
	method esParteDelContenido(texto) = contenidos.any({ contenido => contenido.contiene(texto) })
	
	method contiene(texto) = self.esParteDeQuienLoEnvia(texto) || self.esParteDelContenido(texto)
}

