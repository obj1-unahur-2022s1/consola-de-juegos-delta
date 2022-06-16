import wollok.game.*

const velocidad = 300

object juego{

	method configurar(){
		game.width(20)
		game.height(15)
		game.title("Frogger Game")
		game.boardGround("fondo.png")
		game.addVisual(rana)
		game.addVisual(auto)
		//game.addVisual(auto2)
		game.addVisual(reloj)
	
		keyboard.space().onPressDo{ self.jugar()}
		keyboard.up().onPressDo{ rana.subir()}
		keyboard.down().onPressDo{ rana.bajar()}
		keyboard.right().onPressDo{ rana.derecha()}
		keyboard.left().onPressDo{ rana.izquierda()}
		
		game.onCollideDo(rana,{ obstaculo => obstaculo.chocar()})
		
	} 
	
	method iniciar(){
		rana.iniciar()
		reloj.iniciar()
		auto.iniciar()
	}
	
		
	method jugar(){
		if (rana.estaVivo()) 
			rana.iniciar()
		else {
			game.removeVisual(gameOver)
			self.iniciar()
		}
	}
	method terminar(){
		game.addVisual(gameOver)
		auto.detener()
		reloj.detener()
		rana.morir()
	}

}
	
object gameOver {
	method position() = game.center()
	method text() = "GAME OVER"
	

}

object reloj {
	
	var tiempo = 0
	
	method text() = tiempo.toString()
	method position() = game.at(1, game.height()-1)
	
	method pasarTiempo() {
		tiempo = tiempo +1
	}
	method iniciar(){
		tiempo = 0
		game.onTick(100,"tiempo",{self.pasarTiempo()})
	}
	method detener(){
		game.removeTickEvent("tiempo")
	}
}

object auto {
	 
	var position = self.posicionInicial()

	method image() = "auto1.png"
	method position() = position
	
	method posicionInicial() = game.at(game.width()-1,suelo.position().y())

	method iniciar(){
		position = self.posicionInicial()
		game.onTick(velocidad,"moverAuto",{self.mover()})
	}
	
	method mover(){
		position = position.left(3)
		if (position.x() == -1)
			position = self.posicionInicial()
	}
	
	method chocar(){
		juego.terminar()
	}
    method detener(){
		game.removeTickEvent("moverAuto")
	}
}

object suelo{
	
	method position() = game.origin().up(3)
	
	method image() = "suelo.png"
}


object rana {
	var vivo = true

	var position = game.at(9,0)
	
	method image() = "rana.png"
	method position() = position
	

	method subir(){
		position = position.up(1)
	}
	
	method bajar(){
		position = position.down(1)
	}
	
	method izquierda(){
		position = position.left(1)
	}
	
	method derecha(){
		position = position.right(1)
	}

	
	method morir(){
		game.say(self,"¡Auch!")
		vivo = false
	}
	method iniciar() {
		vivo = true
	}
	method estaVivo() {
		return vivo
	}
}