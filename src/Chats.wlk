import Mensajes.*
import Usuarios.*
import Reestricciones.*

class Chat {
	const participantes = []
	const mensajesEnviados = []
	const creador
	
	method mensajesEnviados() = mensajesEnviados
	
	method esElCreador(participante) = creador == participante
	
	method pesoChat() = mensajesEnviados.sum({ mensaje => mensaje.peso() })
	
	method tienenTodosEspacioLibre(mensajePeso) = participantes.
									all({ participante => participante.tieneEspacioLibre(self.pesoChat() + mensajePeso) })
									
	method notificarATodos() {
		participantes.forEach({ participante => participante.recibirNotificacion(self) })
	}
	
	method escribirMensaje(mensaje) {
		if(self.tienenTodosEspacioLibre(mensaje.peso()))
		{
			mensajesEnviados.add(mensaje)
			self.notificarATodos()
		}
		else
			throw new DomainException(message = "No se pudo enviar el mensaje ya que no hay espacio disponible")
	}
	
	method mensajesDe(participante) = mensajesEnviados.filter({ mensaje => mensaje.usuario() == participante })
	
	method contiene(texto) = mensajesEnviados.any({ mensaje => mensaje.contiene(texto) })
}

class ChatPremium inherits Chat {
	var reestriccionAdicional
	
	method agregarParticipante(participante) {
		participantes.add(participante)
		participante.agregarChat(self)
	}
	
	method eliminarParticipante(participante) {
		participantes.remove(participante)
		participante.eliminarChat(self)
	}
	
	override method escribirMensaje(mensaje) {
		if(reestriccionAdicional.ejecutar(mensaje, self))
			super(mensaje)
	}
}