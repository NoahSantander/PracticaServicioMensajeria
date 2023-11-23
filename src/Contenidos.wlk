import Compresiones.*

class Texto {
	const caracteres 
	
	method peso() = caracteres.size()
	
	method contiene(texto) = caracteres.contains(texto)
}

class Audio {
	const duracion
	
	method peso() = duracion * 1.2
	
	method contiene(texto) {}
}

class Imagen {
	const ancho
	const alto
	const tipoCompresion
	
	method pixelesTotales() = ancho * alto
	
	method peso() = tipoCompresion.calcularPeso(self.pixelesTotales()) * 2
	
	method contiene(texto) {}
}

class GIF inherits Imagen {
	const cantidadDeCuadros
	
	override method peso() = super() * cantidadDeCuadros
}

class Usuario {
	const usuario
	
	method peso() = 3
	
	method contiene(texto) = usuario.contains(texto)
}
