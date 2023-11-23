object difusion {
	method ejecutar(mensaje, chat) = chat.esElCreador(mensaje.usuario())
}

class Reestringido {
	const limite
	
	method noAlcanzoElLimite(chat) = chat.mensajesEnviados().size() < limite
	method ejecutar(mensaje, chat) = self.noAlcanzoElLimite(chat)
}

class Ahorro {
	const pesoMaximo
	
	method noSuperaPeso(mensaje) = mensaje.peso() < pesoMaximo
	 
	method ejecutar(mensaje, chat) = self.noSuperaPeso(mensaje)
}