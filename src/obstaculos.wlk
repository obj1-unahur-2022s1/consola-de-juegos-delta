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
		if (not game.hasVisual(self)){
			game.addVisual(self)		
		}
	}
	
}

class Meta inherits Obstaculo {
		
	method position(nuevaPosicion){
		position = nuevaPosicion
	}
	
	method chocar(){
		nivel.cambiarVelocidadAlLlegarMeta()
		puntos.puntosAlLlegarAMeta()
		game.say(self,"¡Llegaste a la Meta!")
		rana.position(posicion.posicionArbitrariaWidth())
	}
	
}

class ObstaculoMovil inherits Obstaculo {
	var property velocidad
	var property direccion	
	const velocidadInicial = velocidad
	
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
	
	method restablecerVelocidad(){
		velocidad = velocidadInicial
	}
	method aumentarVelocidad(){
		velocidad *= 0.9
	}

}

