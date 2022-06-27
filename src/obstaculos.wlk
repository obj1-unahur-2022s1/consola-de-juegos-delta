import wollok.game.*
import config.*
import utilidades.*
import rana.*
import nivel.*


class Obstaculo {
	
	var position
	var imagen 
	
	method image() = imagen
	method position() = position
	
	method posicionInicial() = position

	method iniciar(){
		position = self.posicionInicial()
		//game.addVisual(self)
	}
	
}


class Meta inherits Obstaculo {
		
	method position(nuevaPosicion){
		position = nuevaPosicion
	}
	
	method chocar(){
		puntos.puntosAlLlegarAMeta()
		game.say(self,"¡Llegaste a la Meta!")
		rana.position(posicion.posicionArbitrariaWidth())
		
	}
	
}


class ObstaculoMovil inherits Obstaculo {
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
		nivel.terminar()
		
	}
}

