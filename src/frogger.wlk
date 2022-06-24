import wollok.game.*
import rana.*
import movimientos.*
import utilidades.*
import obstaculos.*

const musica = game.sound("/ConsolaDeJuegos/assets/audio/remember-the-80s.mp3")

object juego{
	
	method configurar(){
		//game.width(20)
		//game.height(15)
		//game.width(15)
		//game.height(10)
		//game.title("Frogger Game")
			
		game.boardGround("fondo.png")
		 
		game.addVisual(rana)
		 
		
		game.addVisual(auto1)
		game.addVisual(auto2)
		game.addVisual(auto3)
		
		game.addVisual(camion1)
		game.addVisual(camion2)
		
		game.addVisual(tronco1)
		game.addVisual(tronco2)
		
		
		game.addVisual(otrasRanas1)
		game.addVisual(otrasRanas2)
		game.addVisual(otrasRanas3)
		game.addVisual(otrasRanas4)
		
		game.addVisual(meta1)
		game.addVisual(meta2)
		game.addVisual(meta3)
		game.addVisual(meta4)
		game.addVisual(meta5)
		
		
		game.addVisual(textTiempo)
		game.addVisual(textPuntos)
		game.addVisual(puntos)
		game.addVisual(reloj)
		
		
		/* 
		keyboard.space().onPressDo{ self.jugar()}
		keyboard.up().onPressDo{ rana.subir()}
		keyboard.down().onPressDo{ rana.bajar()}
		keyboard.right().onPressDo{ rana.derecha()}
		keyboard.left().onPressDo{ rana.izquierda()}
		
		*/
		keyboard.space().onPressDo{ self.jugar()}
		keyboard.up().onPressDo{ rana.moverDireccion_(arriba)}
		keyboard.down().onPressDo{ rana.moverDireccion_(abajo)}
		keyboard.right().onPressDo{ rana.moverDireccion_(derecha)}
		keyboard.left().onPressDo{ rana.moverDireccion_(izquierda)}
		
		game.onCollideDo(rana,{ obstaculo => obstaculo.chocar()})
		
	} 
	
	method iniciar(){
	
		
		rana.iniciar()
		reloj.iniciar()
		
		auto1.iniciar()
		auto2.iniciar()
		auto3.iniciar()
		
		camion1.iniciar()
		camion2.iniciar()
		
		tronco1.iniciar()
		tronco2.iniciar()
		
		otrasRanas1.iniciar()
		otrasRanas2.iniciar()
		otrasRanas3.iniciar()
		otrasRanas4.iniciar()
		

		
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
		
	
		auto1.detener()
		auto2.detener()
		auto3.detener()
		
		camion1.detener()
		camion2.detener()
		
		tronco1.detener()
		tronco2.detener()
		
		otrasRanas1.detener()
		otrasRanas2.detener()
		otrasRanas3.detener()
		otrasRanas4.detener()
		
		reloj.detener()
		rana.morir()
		puntos.restablecer()
		
		game.say(rana,"¡Presiona SPACE para reanudar!")
	}

}
	
object gameOver {
	method position() = game.center()
	method text() = "GAME OVER"
	
}

/* 
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
*/


/*
object suelo{
	
	method position() = game.origin().up(3)
	
	method image() = "suelo.png"
}


*/

/* 
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
} */