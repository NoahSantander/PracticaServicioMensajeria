object original {
	method calcularPeso(pixeles) = pixeles 
}

class Variable {
	const porcentajeDeCompresion
	
	method calcularPeso(pixeles) = pixeles * porcentajeDeCompresion
}

object maxima {
	method calcularPeso(pixeles) = if(pixeles > 10000) 10000 else pixeles
}
