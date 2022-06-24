import wollok.game.*
import frogger.*
import utilidades.*
import rana.*

class Obstaculo {
	
	var position
	var imagen 
	
	method image() = imagen
	method position() = position
	
	method posicionInicial() = position

	method iniciar(){
		position = self.posicionInicial()
	}
	
}


class Meta inherits Obstaculo {
		
	method position(nuevaPosicion){
		position = nuevaPosicion
	}
	
	method chocar(){
		puntos.puntosAlLlegarAMeta()
		game.say(self,"¡Llegaste a la Meta!")
		rana.position( game.at(game.width()/2,0) )
	}

}


class Auto inherits Obstaculo {
	var velocidad
	var property direccion
	
	method avanzar() {
			position = direccion.proximaPosicionEstiloPacman(self.position())		
	}
	override method iniciar(){
		super()
		game.onTick(velocidad,"moverObstaculo",{self.mover()})		
	}
	
    method detener(){
		game.removeTickEvent("moverObstaculo")
	}
	
	method mover(){
		self.direccion(direccion)
		self.avanzar()
	}
	
	method chocar(){
		juego.terminar()
		
	}
}

