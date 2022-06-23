import wollok.game.*
import frogger.*
import utilidades.*
import rana.*

class Meta {
	var position
	
	method position() = position
	
	method image() = "meta.png"
	
	//method posicionInicial() = game.at(0, game.height()-2)	
	method posicionInicial() = position
		
	method position(nuevaPosicion){
		position = nuevaPosicion
	}
	
	method iniciar(){
		position = self.posicionInicial()

	}
	
	method chocar(){
		game.say(self,"¡Llegaste a la Meta!")
		puntos.puntosAlLlegarAMeta()
		rana.position( game.at(game.width()/2,0) )
	}

}

class Obstaculo {
	var velocidad
	var position //= self.posicionInicial()
	var imagen 
	//const posX
	//const posY
	method image() = imagen //"auto1.png"
	method position() = position
	
	method posicionInicial() = position //= game.at(posX,posY)

	method iniciar(){
		position = self.posicionInicial()
		game.onTick(velocidad,"moverObstaculo",{self.mover()})
	}
	
	method mover()
	
	method chocar()
	
    method detener(){
		game.removeTickEvent("moverObstaculo")
	}
}

class Auto inherits Obstaculo {
	var property direccion
	
	method avanzar() {
			position = direccion.proximaPosicionEstiloPacman(self.position())		
	}
	
	override method mover(){
		/* 
		position = position.left(1)
		if (position.x() == -1)
			position = self.posicionInicial()
		*/
		self.direccion(direccion)
		self.avanzar()
	}
}


class AutosTrampa inherits Auto{
	
	
	//override method posicionInicial()= game.at(game.width()-1,3) //suelo.position().y())
	//override method posicionInicial()= position
	
	override method chocar(){
		juego.terminar()
	}
	
}


class AutosMortales inherits Auto{
	//override method posicionInicial()= game.at(3,game.height()-1)//suelo.position().y())
	//override method posicionInicial()= position
	override method chocar() {
		juego.terminar()
	}
	
	/* 
	override method mover(){
		position = position.right(1)
		if (position.x() == -1)
			position = self.posicionInicial()
	}
	*/
}

