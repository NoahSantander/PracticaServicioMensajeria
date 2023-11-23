import Chats.*
import Mensajes.*

class Usuario {
	const memoria
	const chats = #{}
	const notificaciones = []
	
	method notificaciones() = notificaciones
	
	method pertenece(chat) = chats.contains(chat)
	
	method tieneEspacioLibre(pesoMensajes) = memoria > pesoMensajes
	
	method mandarMensajeA(chat, mensaje) {
		if(self.pertenece(chat))
			chat.escribirMensaje(mensaje)
		else
			throw new DomainException(message = "No se puede enviar el mensaje porque no esta en el chat")
	}
	
	method agregarChat(chat) {
		chats.add(chat)
	} 
	
	method eliminarChat(chat) {
		chats.remove(chat)
	}
	
	method misMensajes() = chats.map({ chat => chat.mensajesDe(self)}).flatten()
	
	method mensajeMasPesado() = self.misMensajes().max({ mensaje => mensaje.peso() })
	
	method buscarPor(texto) = chats.filter({ chat => chat.contiene(texto) }) 
	
	method agregarNotificacion(chat) {
		notificaciones.add(chat)
	}
	
	method eliminarNotificaciones(chat) {
		notificaciones.removeAllSuchThat({ notificacion => notificacion == chat })
	}
	
	method recibirNoticificacion(chat) {
		self.agregarNotificacion(chat)
	}
	
	method leerChat(chat) {
		self.eliminarNotificaciones(chat)
	}
}